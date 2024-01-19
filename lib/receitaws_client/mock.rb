module ReceitawsClient
  module Mock
    class ConsultarCnpj
      def self.executar(cnpj)        
          cnpj  =  cnpj.to_s.gsub(/[^0-9A-Za-z]/, '')
          unless ReceitawsClient::Cnpj.valida_digito_cnpj(cnpj)
            result  = { 'status'  => 'ERROR', 'message'  => 'CNPJ INVALIDO' }
            return ReceitawsClient::Cnpj.new(result)
          end
          result =  {'status' => 'ok', 
            'uf' => "MG", 
            'telefone' => "(99) 9999-9999", 
            'email' => "contato@macrocont.com.br",
            'fantasia' => "UMBRELLA", 
            'nome' => "UMBRELLA INC",
            'cnpj' => 'cnpj', 
            'bairro' => "CENTRO", 
            'logradouro' => "R DOS GOITACAZES", 
            'numero' => "15", 
            'cep' => "30.190-050", 
            'municipio' => "BELO HORIZONTE", 
            'abertura' => "15/05/2014", 
            'data_situacao' => "15/05/2014", 
            'situacao' => "ATIVA", 
            'complemento' => "ANDAR 6 SALA 2",
            'atividade_principal' => [{'code' => "62.03-1-00", 'text' => "Desenvolvimento e licenciamento de programas de computador não-customizáveis"}],
            'porte' => 'MICRO EMPRESA',
            'atividades_secundarias' => [ 
                        {'code' => "58.11-5-00", 'text' => "Edição de livros"},
                        {'code' => "62.02-3-00", 'text' => "Desenvolvimento e licenciamento de programas de computador customizáveis"},
                        {'code' => "62.09-1-00", 'text' => "Suporte técnico, manutenção e outros serviços em tecnologia da informação"},
                        {'code' => "63.11-9-00", 'text' => "Tratamento de dados, provedores de serviços de aplicação e serviços de hospedagem na internet"},
                        {'code' => "63.19-4-00", 'text' => "Portais, provedores de conteúdo e outros serviços de informação na internet"},
                        {'code' => "70.20-4-00", 'text' => "Atividades de consultoria em gestão empresarial, exceto consultoria técnica específica"},
                        {'code' => "72.20-7-00", 'text' => "Pesquisa e desenvolvimento experimental em ciências sociais e humanas"},
                        {'code' => "73.11-4-00", 'text' => "Agências de publicidade"},
                        {'code' => "74.10-2-99", 'text' => "atividades de design não especificadas anteriormente"},
                        {'code' => "74.90-1-04", 'text' => "Atividades de intermediação e agenciamento de serviços e negócios em geral, exceto imobiliários"},
                        {'code' => "82.30-0-01", 'text' => "Serviços de organização de feiras, congressos, exposições e festas"},
                        {'code' => "82.99-7-05", 'text' => "Serviços de levantamento de fundos sob contrato"},
                        {'code' => "85.50-3-02", 'text' => "Atividades de apoio à educação, exceto caixas escolares"},
                        {'code' => "85.92-9-99", 'text' => "Ensino de arte e cultura não especificado anteriormente"},
                        {'code' => "85.99-6-03", 'text' => "Treinamento em informática"},
                        {'code' => "85.99-6-04", 'text' => "Treinamento em desenvolvimento profissional e gerencial"},
                        {'code' => "85.99-6-99", 'text' => "Outras atividades de ensino não especificadas anteriormente"},
                        {'code' => "90.01-9-01", 'text' => "Produção teatral"}, {'code' => "90.01-9-02", 'text' => "Produção musical"},
                        {'code' => "90.01-9-03", 'text' => "Produção de espetáculos de dança"},
                        {'code' => "90.01-9-04", 'text' => "Produção de espetáculos circenses, de marionetes e similares"},
                        {'code' => "90.01-9-99", 'text' => "Artes cênicas, espetáculos e atividades complementares não especificadas anteriormente"}
            ]
          }

          return ReceitawsClient::Cnpj.new(result)
      end
    end
  end
end