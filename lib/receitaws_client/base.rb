# frozen_string_literal: true

module ReceitawsClient
  class Base
    require 'uri'
    require 'net/http'
    require 'timeout'

    def self.build_request(endpoint, metodo, body = nil)
      url = URI("#{ReceitawsClient.base_uri}/#{endpoint}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      case metodo
      when 'delete'
        request = Net::HTTP::Delete.new(url)
      when 'get'
        request = Net::HTTP::Get.new(url)
      when 'put'
        request = Net::HTTP::Put.new(url)
      when 'post'
        request = Net::HTTP::Post.new(url)
      end
      request = ReceitawsClient::Base.default_headers request

      request.body = body.to_json unless body.nil?

      begin
        status = Timeout.timeout(ReceitawsClient.timeout.to_i) do
          return http.request(request)
        end
      rescue Timeout::Error
        puts 'That took too long, exiting...'
        nil
      end
    end

    def self.default_headers(request)
      request['authorization'] = "Bearer #{ReceitawsClient.token}"
      request['Content-Type'] = 'application/json'
      request
    end
  end
end
