require 'rubygems'
require 'sinatra'
require 'BlueCloth'
require 'json'
require 'yaml'

#boost performance and allow Cross Origin Resource Sharing
disable :protection

get '/' do
	#will serve up an index later
end

#just give me my markdown
post '/to_html/' do
	content_type :json
	markdown = BlueCloth.new(params[:markdown])
	{:html => markdown.to_html}.to_json
end