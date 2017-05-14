require "test_helper"

describe Map do
  let(:map) { Map.new }

  it "must be valid" do
    value(map).must_be :valid?
  end
end
