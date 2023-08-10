require 'sinatra'
require 'json'

markers = []

get '/api/markers' do
  content_type :json
  markers.to_json
end

post '/api/markers' do
  request.body.rewind
  data = JSON.parse(request.body.read)

  marker = {
    id: markers.length + 1,
    lat: data['lat'],
    lng: data['lng']
  }

  markers << marker

  content_type :json
  marker.to_json
end

put '/api/markers/:id' do |id|
  request.body.rewind
  data = JSON.parse(request.body.read)

  marker = markers.find { |m| m[:id] == id.to_i }

  if marker
    marker[:lat] = data['lat']
    marker[:lng] = data['lng']
    content_type :json
    marker.to_json
  else
    status 404
  end
end
