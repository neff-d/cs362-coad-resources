require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

    setup do
        u = create(:defaultUser)
        dc = DashboardController.new

    end

    it "exists" do
        dc = DashboardController.new
        expect(dc).to be_a(DashboardController)
    end

    describe "GET #index while logged out" do
        it { expect(get(:index)).to redirect_to(new_user_session_path) }
    end

    

end
