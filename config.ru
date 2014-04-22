require './app'
require 'rack'

use Rack::Static, :urls => ['/static'], :root => '.'
run Rubb::App.new
