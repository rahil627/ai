require "kemal"
require "json"

# Define property data structure
struct Property
  address: String
  current_owner: String
  previous_owners: Array(String)
  cost: Float64
  latitude: Float64
  longitude: Float64
end

# Sample property data
properties = [
  Property.new("123 Main St", "John Doe", ["Jane Smith", "Michael Johnson"], 250000.0, 37.7749, -122.4194),
  # Add more properties here...
]

# Serve index.html
get "/" do |env|
  File.read("public/index.html")
end

# Serve script.js
get "/script.js" do |env|
  File.read("public/script.js")
end

# Provide property data as JSON
get "/properties" do |env|
  res = HTTP::Server::Response.new(env)
  res.content_type = "application/json"
  res.print properties.to_json
end

Kemal.run
