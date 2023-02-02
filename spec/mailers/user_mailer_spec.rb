require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

    it 'exists' do
        expect(UserMailer).to be_a(Class)
    end

end
