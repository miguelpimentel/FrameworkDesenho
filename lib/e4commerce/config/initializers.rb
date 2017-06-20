require 'boletosimples'
require 'dalli'

PagSeguro.configure do |config|
  config.token       = "seu token"
  config.email       = "seu e-mail"
  config.environment = :production # ou :sandbox. O padrão é production.
  config.encoding    = "UTF-8" # ou ISO-8859-1. O padrão é UTF-8.
end

BoletoSimples.configure do |c|
  c.environment = :production # defaut :sandbox
  c.access_token = 'access-token'
end

BoletoSimples.configure do |c|
    c.cache = ActiveSupport::Cache.lookup_store(:dalli_store, ['localhost:11211'], namespace: 'boletosimples_client', compress: true)
end

