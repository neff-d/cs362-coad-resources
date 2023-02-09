require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    it "exists" do
        tc = TicketsController.new
        expect(tc).to be_a(TicketsController)
    end

 
end
