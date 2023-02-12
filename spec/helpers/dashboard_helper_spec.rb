require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do

    it 'exists' do
        expect(DashboardHelper.inspect).to eq('DashboardHelper')
    end

    it 'has a method dashboard_for' do
        expect(DashboardHelper.method_defined?(:dashboard_for)).to be true
    end

    it 'can tell if a user is admin' do
        a = create(:adminUser)
        expect(dashboard_for(a)).to eq('admin_dashboard')
    end

    it 'can tell if user has org application' do
        u = User.new(email: 'example@example.com', password: 'password')
        expect(dashboard_for(u)).to eq('create_application_dashboard')
    end

    
    it 'can tell if user has org submitted' do
        u = create(:defaultUser)
        u.organization.status = :submitted
        expect(dashboard_for(u)).to eq('organization_submitted_dashboard')
    end

    
    it 'can tell if user has org approved' do
        u = create(:defaultUser)
        u.organization.status = :approved
        expect(dashboard_for(u)).to eq('organization_approved_dashboard')
    end

    
    
end
