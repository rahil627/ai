defmodule GeoLocationMarkersAppWeb.Router do
  use GeoLocationMarkersAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GeoLocationMarkersAppWeb do
    pipe_through :api

    post "/markers", MarkerController, :create
    put "/markers/:id", MarkerController, :update
  end

  # Other routes...
end
