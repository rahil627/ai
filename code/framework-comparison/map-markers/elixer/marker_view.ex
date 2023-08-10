defmodule GeoLocationMarkersApiWeb.MarkerView do
  use GeoLocationMarkersApiWeb, :view

  def render("marker.json", %{marker: marker}) do
    %{id: marker.id, lat: marker.lat, lng: marker.lng}
  end
end
