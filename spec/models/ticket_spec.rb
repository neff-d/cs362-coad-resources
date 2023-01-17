require 'rails_helper'

RSpec.describe Ticket, type: :model do
    it "exists" do
        t = Ticket.new
        expect(t).to be_a(Ticket)
       end

end
