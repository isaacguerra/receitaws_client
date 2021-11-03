# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'receitaws_client/version'

Gem::Specification.new do |spec|
  spec.name                   = 'receitaws_client'
  spec.version                = ReceitawsClient::Version::STRING
  spec.platform               = Gem::Platform::RUBY
  spec.authors                 = ['Isaac Guerra']
  spec.email                   = ['guerra.isaac@gmail.com']
  spec.summary                = 'Gem ReceitaWSClient API COM PLANO - Consulta de Dados de CNPJ'
  spec.description            = 'Client Rails não oficial do Webservice da ReceitaWS - https://receitaws.com.br/'
  spec.homepage               = 'https://github.com/isaacguerra/receitaws_client'
  spec.license                = 'MIT'

  spec.files                  = ['.gitignore', 'Gemfile', 'LICENSE', 'README.md', 'Rakefile',
                                 'lib/receitaws_client.rb', 'lib/receitaws_client/base.rb',
                                 'lib/receitaws_client/cnpj.rb', 'lib/receitaws_client/configure.rb',
                                 'lib/receitaws_client/consultar_cnpj.rb', 'lib/receitaws_client/version.rb',
                                 'lib/receitaws_client/mock.rb', 'receitaws_client.gemspec']
  spec.executables            = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files             = spec.files.grep(%r{^(test|spec|features)/})

  spec.require_paths          = ['lib']

  spec.required_ruby_version  = Gem::Requirement.new('>= 1.9')
end
