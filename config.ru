require 'rubygems'
require 'rack/cors'

use Rack::Cors do
	allow do
		origins '*'
		resource '/to_html/*', :headers => :any, :methods => [:get, :post, :put, :delete]
	end
end

require File.join(File.dirname(__FILE__),'app.rb')
run Sinatra::Application