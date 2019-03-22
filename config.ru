require 'bundler'
Bundler.require

if ENV['RACK_ENV'] == 'production'
  use Rack::Rewrite do
    r301 %r{.*}, 'https://www.uec-tamars.com$&', :if => Proc.new {|rack_env|
      rack_env['SERVER_NAME'] != 'www.uec-tamars.com'
    }
    r301 %r{.*}, 'https://www.uec-tamars.com$&', :scheme => 'http'
  end
end

require './app'
run Sinatra::Application
