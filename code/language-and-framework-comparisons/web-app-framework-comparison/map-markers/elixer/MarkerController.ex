defmodule GeoLocationMarkersApiWeb.MarkerController do
  use GeoLocationMarkersApiWeb, :controller

  def create(conn, %{"lat" => lat, "lng" => lng}) do
    # Implement your logic to create a marker using lat and lng
    conn
    |> put_status(:created)
    |> render("marker.json", marker: marker)
  end

  def update(conn, %{"id" => id, "lat" => lat, "lng" => lng}) do
    # Implement your logic to update a marker's lat and lng
    conn
    |> put_status(:ok)
    |> render("marker.json", marker: marker)
  end
end
