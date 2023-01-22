require 'rails_helper'

RSpec.describe 'User registration', type: :feature do

    it 'allows a user to register' do
        visit '/users/sign_up'
        fill_in 'Email', with: 'example@example.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'

        expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')

    end

end
