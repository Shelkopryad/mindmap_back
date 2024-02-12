require 'rails_helper'

RSpec.describe TestCase, type: :model do
  it "TestCase without params isn't valid" do
    expect(TestCase.new).to_not be_valid
  end

  it "TestCase without name isn't valid" do
    expect(TestCase.new(steps: 'one two three', to_test: false)).to_not be_valid
  end

  it "TestCase with name is valid" do
    expect(TestCase.new(name: 'First')).to be_valid
  end
end
