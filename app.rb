require 'rubygems'
require 'sinatra'
require 'redcarpet'
require 'json'
require 'yaml'

#boost performance and allow Cross Origin Resource Sharing
disable :protection

#setup our redcarpet renderer
markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :autolink => true)

#the following was taken from Github Flavored Markdown
#http://github.github.com/github-flavored-markdown/
#in very clear cases, let newlines become <br /> tags
def prep_newlines(text)
	text.gsub!(/^[\w\<][^\n]*\n+/) do |x|
		x =~ /\n{2}/ ? x : (x.strip!; x << "  \n")
	end
	text
end

get '/' do
	#will serve up an index later
end

#just give me my markdown
post '/to_html/' do
	content_type :json
	user_input = prep_newlines(params[:markdown])
	{:html => markdown.render(user_input)}.to_json
end