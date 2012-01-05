require 'rubygems'
require 'sinatra'
require 'BlueCloth'
require 'json'
require 'yaml'

CONFIG =  YAML.load_file(File.join(File.dirname(__FILE__),'config.yml'))
allowed_hosts = CONFIG['allowed_hosts']

#forbbiden message
error 403 do
	'Access forbidden'
end

#basic host check
before do
	if !allowed_hosts.include? request.ip
		error 403
	end
end

get '/' do
	#will serve up an index later
end

#just give me my markdown
post '/markdown/to_html/' do
	content_type :json
	markdown = params[:markdown]
	{:html => BlueCloth.new(markdown).to_html}.to_json
end