require "http/server"
require "json"

# Define property data structure
struct Property
  address : String
  current_owner : String
  previous_owners : Array(String)
  cost : Float64
  latitude : Float64
  longitude : Float64
end

# Sample property data
properties = [
  Property.new("123 Main St", "John Doe", ["Jane Smith", "Michael Johnson"], 250000.0, 37.7749, -122.4194),
  # Add more properties here...
]

server = HTTP::Server.new do |context|
  case context.request.path
  when "/"
    context.response.content_type = "text/html"
    context.response.print File.read("public/index.html")
  when "/script.js"
    context.response.content_type = "text/javascript"
    context.response.print File.read("public/script.js")
  when "/properties"
    context.response.content_type = "application/json"
    context.response.print properties.to_json
  else
    context.response.content_type = "text/plain"
    context.response.print "Not Found"
    context.response.status_code = 404
  end
end

address = "0.0.0.0"
port = 3000
puts "Listening on http://#{address}:#{port}"
server.bind_tcp(address, port)
server.listen
