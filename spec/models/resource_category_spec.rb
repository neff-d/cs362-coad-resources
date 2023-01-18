require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    it "exists" do
        r = ResourceCategory.new
        expect(r).to be_a(ResourceCategory)
       end

    it {should have_and_belong_to_many(:organizations).class_name('Organization')}
    it {should have_many(:tickets).class_name('Ticket')}
    
    it "should be less than 255 characters long" do
        r = ResourceCategory.new
        r.name = "i" * 256
        expect(r).to_not be_valid
    end
    it "should have at least 1 character" do
        r = ResourceCategory.new
        r.name = "i" * 0
        expect(r).to_not be_valid
    end
end
