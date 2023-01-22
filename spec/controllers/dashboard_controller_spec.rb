require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

    it "exists" do
        dc = DashboardController.new
        expect(dc).to be_a(DashboardController)
    end

end
