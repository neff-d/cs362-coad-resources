require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

    it 'visits the new ticket page' do
        visit new_ticket_path
        expect(page).to have_content("This creates ticket in the system, which will be reviewed and responded to via phone.")
    end

end
