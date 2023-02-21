require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

    before(:each) do
        @u = create(:defaultUser)
        @dc = DashboardController.new
    end

    it "exists" do
        expect(@dc).to be_a(DashboardController)
    end

    it "GET #index while logged out" do
        expect(get(:index)).to redirect_to(new_user_session_path)
    end

    it "GET #index while logged in" do
        #http 200
        sign_in @u
        expect(get(:index)).to have_http_status(200)
    end

    it "sets status options user" do
        sign_in @u
        get(:index)
        expect(assigns(:status_options)).to eq(["Open"])
    end
end
