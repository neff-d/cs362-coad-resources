require 'rails_helper'

RSpec.describe Ticket, type: :model do
    it "exists" do
        t = Ticket.new
        expect(t).to be_a(Ticket)
       end
    
    it {should belong_to(:region).class_name('Region')}
    it {should belong_to(:organization).class_name('Organization')}
    it {should belong_to(:resource_category).class_name('ResourceCategory')}

end
