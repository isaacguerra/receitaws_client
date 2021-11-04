Acesso a documentação de desenvolvimento da [https://receitaws.com.br/](https://receitaws.com.br/api)

## Instalando

### Gemfile

Adicione esta linha ao Gemfile do seu aplicativo:

```ruby
  gem 'receitaws_client'
```

 - Execute o comando `bundle install`.

### Instalação direta

```ruby
  gem install receitaws_client
```

## Configuração

Para fazer a autenticação, você precisará configurar as credenciais da ReceitaWSClient. Crie o arquivo `config/initializers/receitaws_client.rb` com o conteúdo abaixo.

```ruby
Receitaws.configure do |config|

  #
  # Cadastrar token fornecido no cadastro na ReceitaWS
  config.token = 'sustitual pelo seu token'

  #
  # Opções de ambiente
  # Quantidade máxima de dias com relação à última consulta na Receita Federal deste CNPJ
  config.days = 365

  #
  # Tempo de espera pela resposta do WeService em segundos
  config.timeout = 10

  #
  # plano - comenrcial ou gratis
  config.plano = 'gratis'

  #
  # dados mockados para development e testes
  config.mock_test = true
  config.mock_development = true

end
```

## Consultar CNPJ

Nesse endpoint é realizado a consulta de um CNPJ.

> Enviar somente os números do CNPJ, sem pontos e traços.

Será retornado um objeto do tipo **ReceitawsClient::Cnpj** descrito abaixo.


```ruby
cnpj = ReceitawsClient::ConsultarCnpj.executar 20254766000100
```

Verificar se se a consulta foi realizada com sucesso.

```ruby
#
# Caso tenha ocorrido algum erro na consulta
cnpj.status == :error

#
# Mensagem explicativa indicando erro.
cnpj.message
# Possíveis mensagens de retorno:
# "Timeout"
# "CNPJ inválido"
# "CNPJ rejeitado pela Receita Federal"

#
# Consulta realizada com sucesso
cnpj.status == :ok

#
# LIsta de atributos disponíveis

# CNPJ no formato 00.000.000/0000-00.
cnpj.cnpj

# Data de abertura no formato dd/mm/aaaa.
cnpj.abertura

# Razão social.
cnpj.nome

# Nome fantasia.
cnpj.fantasia

# Logradouro.
cnpj.logradouro

# Número.
cnpj.numero

# Complemento.
cnpj.complemento

# CEP no formato 00.000-000.
cnpj.cep

# Bairro.
cnpj.bairro

# Município.
cnpj.municipio

# Sigla da Unidade da Federação.
cnpj.uf

# Email.
cnpj.email

  # Telefone.
cnpj.telefone

# Situação.
cnpj.situacao

# Data da situação no formato dd/mm/aaaa.
cnpj.data_situacao

# Lista (Array de Hash) completa de todos os CNAE do CNPJ
# O primeiro da lista será sempre o CNAE Principal
cnpj.atividades

# Descrição da atividade.
cnpj.atividades[0][:text]

# Código CNAE da atividade no formato 00.00-0-00.
cnpj.atividades[0][:code]

# Lista (Array) completa de todos os CNAE do CNPJ
# Somente os números dos CNAES sem pontos e traços
cnpj.cnaes

```
## Mock para Testes 

Esses metodos respondem sem consumir a api com dados fakes

```ruby
cnpj = ReceitawsClient::Mock::ConsultarCnpj.executar 20254766000100
```

Verificar se se a consulta foi realizada com sucesso.

```ruby


---


## Contributing

- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
- Fork the project.
- Start a feature/bugfix branch.
- Commit and push until you are happy with your contribution.
- Don't forget to rebase with branch master in main project before submit the pull request.
- Please don't change the gemspec file, Rakefile, version, or history.

## Autor
- Este projeto é um fork do projeto original de
- [Leandro Falcão](https://github.com/lsfalcao)
- Contribuição e melhorias realizadas por
- [Isaac Guerra](http://github.com/isaacguerra)
## Copyright

- [Leandro Falcão](https://github.com/lsfalcao)
- [Isaac Guerra](http://github.com/isaacguerra)

The MIT License (MIT)

Copyright (c) 2019 QW3

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
