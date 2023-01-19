require 'rails_helper'

RSpec.describe Ticket, type: :model do
    it "exists" do
        t = Ticket.new
        expect(t).to be_a(Ticket)
       end

    it {should validate_length_of(:name).is_at_least(1)}
    it {should validate_length_of(:name).is_at_most(255)}
    it {should validate_length_of(:description).is_at_most(1020)}
    it {should belong_to(:region).class_name('Region')}
    it {should belong_to(:organization).class_name('Organization')}
    it {should belong_to(:resource_category).class_name('ResourceCategory')}

     

end
