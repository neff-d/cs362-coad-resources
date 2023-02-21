require 'rails_helper'



RSpec.describe Ticket, type: :model do

    before(:each) do
        rc = create(:resource_category)
        r = create(:region)
        @openTicket = Ticket.new(name: 'Test Open', resource_category: rc, region: r, resource_category_id: 76, closed: false)
        @closedTicket = Ticket.new(name: 'Test Closed', resource_category: rc, region: r, resource_category_id: 76, closed: true)
    end

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
    #it {should validate_presence_of(:organization)}

    it "expects an open ticket to be open" do
        t = Ticket.new
        t.closed = true
        expect(t.open?).to be false
    end

    it "is captured by an organization" do
        t = Ticket.new
        o = Organization.new
        t.organization = o
        expect(t.captured?).to be true
    end

    it "has a string description" do
        t = Ticket.new
        t.id = 'something'
        expect(t.to_s).to be_a String
    end
end
