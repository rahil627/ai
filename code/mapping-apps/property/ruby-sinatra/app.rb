require 'sinatra'
require 'geocoder'

set :bind, '0.0.0.0'  # This allows access from other devices on the network

get '/' do
  erb :index
end

post '/property_info' do
  address = params[:address]
  location = Geocoder.search(address).first

  if location
    @property_data = {
      address: location.address,
      current_owner: 'John Doe',
      previous_owner: 'Jane Smith',
      cost: '$500,000'
    }
    erb :property_info
  else
    @error_message = 'Property not found.'
    erb :index
  end
end
