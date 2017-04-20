require "test_helper"

describe HighSchoolsController do
  let(:high_school) { high_schools :one }

  it "gets index" do
    get high_schools_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_high_school_url
    value(response).must_be :success?
  end

  it "creates high_school" do
    expect {
      post high_schools_url, params: { high_school: { act_code: high_school.act_code, latitude: high_school.latitude, longitude: high_school.longitude, name: high_school.name, street_line1: high_school.street_line1, street_line2: high_school.street_line2, street_line3: high_school.street_line3 } }
    }.must_change "HighSchool.count"

    must_redirect_to high_school_path(HighSchool.last)
  end

  it "shows high_school" do
    get high_school_url(high_school)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_high_school_url(high_school)
    value(response).must_be :success?
  end

  it "updates high_school" do
    patch high_school_url(high_school), params: { high_school: { act_code: high_school.act_code, latitude: high_school.latitude, longitude: high_school.longitude, name: high_school.name, street_line1: high_school.street_line1, street_line2: high_school.street_line2, street_line3: high_school.street_line3 } }
    must_redirect_to high_school_path(high_school)
  end

  it "destroys high_school" do
    expect {
      delete high_school_url(high_school)
    }.must_change "HighSchool.count", -1

    must_redirect_to high_schools_path
  end
end
