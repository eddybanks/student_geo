require "test_helper"

describe MapsController do
  let(:map) { maps :one }

  it "gets index" do
    get maps_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_map_url
    value(response).must_be :success?
  end

  it "creates map" do
    expect {
      post maps_url, params: { map: { name: map.name } }
    }.must_change "Map.count"

    must_redirect_to map_path(Map.last)
  end

  it "shows map" do
    get map_url(map)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_map_url(map)
    value(response).must_be :success?
  end

  it "updates map" do
    patch map_url(map), params: { map: { name: map.name } }
    must_redirect_to map_path(map)
  end

  it "destroys map" do
    expect {
      delete map_url(map)
    }.must_change "Map.count", -1

    must_redirect_to maps_path
  end
end
