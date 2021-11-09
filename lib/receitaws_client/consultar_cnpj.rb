# frozen_string_literal: true

module ReceitawsClient
  class ConsultarCnpj < Base
    # Metodo para consultar um CNPJ
    # cnpj: obrigatório, numérico, o CNPJ a ser pesquisado
    # Retonar um obejto do tipo Receitaws::Cnpj
    def self.executar(cnpj)
      if (Rails.env.development? && ReceitawsClient.mock_development) || (Rails.env.test? && ReceitawsClient.mock_test)
        return ReceitawsClient::Mock::ConsultarCnpj.executar cnpj
      end

      Rails.logger.tagged 'ReceitawsClient' do
        cnpj = cnpj.to_s.gsub(/[^0-9A-Za-z]/, '')
        unless ReceitawsClient::Cnpj.valida_digito_cnpj(cnpj)
          Rails.logger.info 'CNPJ INVALIDO'
          result = { 'status' => 'ERROR', 'message' => 'CNPJ INVALIDO' }
          return ReceitawsClient::Cnpj.new(result)
        end
        response = build_request endpoint(cnpj), 'get'
        begin
          result = JSON.parse(response.read_body) unless response.nil?
          Rails.logger.info 'Busca de CNPJ OK'
          return ReceitawsClient::Cnpj.new(result)
        rescue StandardError
          Rails.logger.info 'ERROR - Serviço ReceitaWS não retornou a solicitação!'
          result = { 'status' => 'error', 'message' => 'ERROR - Serviço ReceitaWS não retornou a solicitação!' }
          return result
        end
      end
    end

    def self.endpoint(cnpj)
      return "cnpj/#{cnpj}" if ReceitawsClient.plano == 'gratis'
      "cnpj/#{cnpj}/days/#{ReceitawsClient.days}"
    end
  end
end
