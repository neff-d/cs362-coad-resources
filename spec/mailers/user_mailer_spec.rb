require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

    it 'exists' do
        expect(UserMailer).to be_a(Class)
    end

    it 'sends an email' do
        params = { to: 'example@example.com', new_organization: Organization.new }
        email = UserMailer.with(params).new_organization_application
        expect(email).to have_content params[:to]
    end

    it 'cannot send an email in development' do
        #set environment to development
        allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('development'))
        params = { to: 'example@example.com', new_organization: Organization.new }
        email = UserMailer.with(params).new_organization_application
        expect(email).to have_content ''
    end
end
