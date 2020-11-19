# frozen_string_literal: true

require 'sinatra'
require 'json'
require File.expand_path 'app.rb', __dir__
require File.expand_path 'database.rb', __dir__

set :port, 4000
set :allow_origin, :any
set :bind, '0.0.0.0'
configure do
  enable :cross_origin
end
before do
  response.headers['Access-Control-Allow-Origin'] = '*'
end

# routes...
options '*' do
  response.headers['Allow'] = 'GET, PUT, POST, DELETE, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token'
  response.headers['Access-Control-Allow-Origin'] = '*'
  200
end
def json(data_object)
  content_type :json
  data_object.to_json
end

post '/' do
  data = JSON.parse(request.body.read)
  json UrlShortener.find_or_create(url: data['url'])
end

get '/:host' do
  host = '/' + params[:host]
  response = Database.find(item: host, key: 'short_url')
  if response.nil?
    not_found 
  else
    if params[:reqtype] == 'frontend'
      json "{'url': '#{response[:url]}'}"
    else
      redirect response[:url], 301, "{'url': '#{response[:url]}'}"
    end
  end
end
