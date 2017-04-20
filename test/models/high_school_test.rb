require "test_helper"

describe HighSchool do
  let(:high_school) { HighSchool.new }

  it "must be valid" do
    value(high_school).must_be :valid?
  end
end
