require 'rails_helper'

RSpec.describe Region, type: :model do

  it "exists" do
    r = Region.new
    expect(r).to be_a(Region)
  end

  it "has a name" do
    region = Region.new
    expect(region).to respond_to(:name)
  end

  it "has a string representation that is its name" do
    name = 'Mt. Hood'
    region = Region.new(name: name)
    result = region.to_s
    expect(result).to eq(name)
  end

  it "can be unspecified" do
    expect(Region.unspecified.name).to be('Unspecified')
  end

  it {should have_many(:tickets).class_name('Ticket')}
end
