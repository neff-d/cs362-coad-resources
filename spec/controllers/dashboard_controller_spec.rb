require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

include Devise::Test::ControllerHelpers

    before(:each) do
        @u = create(:defaultUser)
        @admin = create(:adminUser)
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

    it "can recieve :current.user.admin?" do
        allow(@dc).to receive(:current_user).and_return(@admin)
        expect(@dc.current_user.admin?).to eq(true)
    end

    it "can recieve :current.user.organization&.approved?" do
        allow(@dc).to receive(:current_user).and_return(@u)
        expect(@dc.current_user.organization&.approved?).to eq(false)
    end

        it "as no one" do
            allow(@dc).to receive(:tickets).and_return([nil, nil])   
            allow(@dc).to receive(:current_user).and_return(@u)

            @dc.index  

            expect(@dc.instance_variable_get(:@status_options)).to eq(['Open'])
        end

        it "as an admin" do
            allow(@dc).to receive(:tickets).and_return([nil, nil])   
            allow(@dc).to receive(:current_user).and_return(@admin)

            @dc.index

            expect(@dc.instance_variable_get(:@status_options)).to eq(['Open', 'Captured', 'Closed'])
        end

        it "as an organization" do
            allow(@dc).to receive(:tickets).and_return([nil, nil])   
            
            
            @u.organization.approve
            allow(@dc).to receive(:current_user).and_return(@u)

            @dc.index

            expect(@dc.instance_variable_get(:@status_options)).to eq(['Open', 'My Captured', 'My Closed'])
        end

end
