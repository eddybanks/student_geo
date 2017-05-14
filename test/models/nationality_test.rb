require "test_helper"

describe Nationality do
  let(:nationality) { Nationality.new }

  it "must be valid" do
    value(nationality).must_be :valid?
  end
end
