require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do

    it 'can be done from the dashboard' do

        user = create(:defaultUser, :admin)
        organization = create(:defaultOrganization)
        log_in_as(user)

        visit dashboard_path

        click_on 'Organizations'
        click_on 'Pending'
        click_on 'Review'
        click_on 'Reject'

        expect(organization.reload.approved?).to be false

    end

    
end
