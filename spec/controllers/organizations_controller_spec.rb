require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

    it "exists" do
        oc = OrganizationsController.new
        expect(oc).to be_a(OrganizationsController)
    end

end
