require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    it "exists" do
        r = ResourceCategory.new
        expect(r).to be_a(ResourceCategory)
       end

    it {should have_and_belong_to_many(:organizations).class_name('Organization')}
    it {should have_many(:tickets).class_name('Ticket')}
end
