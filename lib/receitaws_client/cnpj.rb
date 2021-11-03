# frozen_string_literal: true

module ReceitawsClient
  class Cnpj
    attr_reader :status, :message, :nome, :uf, :telefone, :email, :fantasia, :cnpj, :bairro, :logradouro, :numero,
                :cep, :municipio, :abertura, :data_situacao, :complemento, :atividades, :cnaes, :situacao

    def initialize(result = nil)
      if result.nil?
        @status = :error
        @message = 'Timeout'
        return self
      end

      if result['status'] == 'ERROR'
        @status = :error
        @message = result['message']
        return self
      end

      @status = :ok
      @nome = result['nome']
      @uf = result['uf']
      @telefone = result['telefone']
      @email = result['email']
      @fantasia = result['fantasia']
      @cnpj = result['cnpj']
      @bairro = result['bairro']
      @logradouro = result['logradouro']
      @numero = result['numero']
      @cep = result['cep']
      @municipio = result['municipio']
      @abertura = result['abertura']
      @data_situacao = result['data_situacao']
      @situacao = result['situacao']
      @complemento = result['complemento']
      @atividades = []
      result['atividade_principal'].each do |atividade|
        @atividades << { code: atividade['code'], text: atividade['text'] }
      end
      result['atividades_secundarias'].each do |atividade|
        @atividades << { code: atividade['code'], text: atividade['text'] }
      end
      @cnaes = @atividades.collect { |a| a[:code].to_s.gsub(/[^0-9A-Za-z]/, '') }

      self
    end

    def self.valida_digito_cnpj(cnpj)
        return false if cnpj.nil? || cnpj.blank?
        nulos = %w[11111111111111 22222222222222 33333333333333 44444444444444 55555555555555 66666666666666
                   77777777777777 88888888888888 99999999999999 00000000000000]
        valor = cnpj.scan(/[0-9]/)
        if valor.length == 14 && !nulos.member?(valor.join)
          valor = valor.collect(&:to_i)
          soma = valor[0] * 5 + valor[1] * 4 + valor[2] * 3 + valor[3] * 2 + valor[4] * 9 + valor[5] * 8 + valor[6] * 7 + valor[7] * 6 + valor[8] * 5 + valor[9] * 4 + valor[10] * 3 + valor[11] * 2
          soma -= (11 * (soma / 11))
          resultado1 = [0, 1].include?(soma) ? 0 : 11 - soma
          if resultado1 == valor[12]
            soma = valor[0] * 6 + valor[1] * 5 + valor[2] * 4 + valor[3] * 3 + valor[4] * 2 + valor[5] * 9 + valor[6] * 8 + valor[7] * 7 + valor[8] * 6 + valor[9] * 5 + valor[10] * 4 + valor[11] * 3 + valor[12] * 2
            soma -= (11 * (soma / 11))
            resultado2 = [0, 1].include?(soma) ? 0 : 11 - soma
            return true if resultado2 == valor[13] # CNPJ válido
          end
        end
        false # CNPJ inválido
      end
  end
end
