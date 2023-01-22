require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do

    before do
        @user = User.create!(email: 'example@example.com', password: 'password', password_confirmation: 'password')
    end

    it 'approves an organization' do

        visit new_user_session_path
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        click_button 'Sign in'

        expect(page).to have_content('You have to confirm your email address before continuing.')

    end


end
