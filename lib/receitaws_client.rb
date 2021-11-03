# frozen_string_literal: true

require 'rubygems'
require 'active_model'

require 'receitaws_client/version'
require 'receitaws_client/configure'
require 'receitaws_client/base'
require 'receitaws_client/consultar_cnpj'
require 'receitaws_client/cnpj'
require 'receitaws_client/mock'

module ReceitawsClient
  extend ReceitawsClient::Configure
end
