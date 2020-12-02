require 'rack'
require './tamagotchi/menu'

use Rack::Reloader, 0
use Rack::Static, :urls => ["/views"]

run Pet_Menu