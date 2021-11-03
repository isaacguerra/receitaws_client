# frozen_string_literal: true

module ReceitawsClient
  module Configure
    # Endereço do WeService
    URL_RECEITAWS   = 'https://www.receitaws.com.br'

    # Parâmetros iniciais
    API_VERSION     = 'v1'

    # Parâmetros iniciais
    TOKEN           = ''

    # Parâmetros iniciais
    DAYS            = 365

    # Parâmetros iniciais
    TIMEOUT         = 10

    # Parâmetros iniciais
    PLANO           = 'gratis'

    # Endereço do WeService
    attr_writer :url

    # Enviado pela ReceitaWS
    attr_writer :api_version

    # Enviado pela ReceitaWS
    attr_writer :token

    # Obrigatório, numérico, quantidade máxima de dias com relação à última consulta na Receita Federal deste CNPJ
    attr_writer :days

    # Obrigatório, numérico, Tempo de espera pela resposta do WeService em segundos
    attr_writer :timeout

    # Obrigatório, numérico, Tempo de espera pela resposta do WeService em segundos
    attr_writer :plano

    # Comando que recebe as configurações
    def configure
      yield self if block_given?
    end

    # Definir url_receitaws
    def url_receitaws
      @url_receitaws ||= URL_RECEITAWS
    end

    # Definir api_version
    def api_version
      @api_version ||= API_VERSION
    end

    # Definir token
    def token
      @token ||= TOKEN
    end

    # Definir days
    # Obrigatório, numérico, quantidade máxima de dias com relação à última consulta na Receita Federal deste CNPJ
    def days
      @days ||= DAYS
    end

    # Definir timeout em segundos
    # Tempo de espera pela resposta do WeService em segundos
    def timeout
      @timeout ||= TIMEOUT
    end

    # Definir plano
    def plano
      @plano ||= PLANO
    end

    # Definir url que será utilizado
    def base_uri
      "#{url_receitaws}/#{api_version}"
    end
  end
end
