require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

    it "exists" do
        oc = OrganizationsController.new
        expect(oc).to be_a(OrganizationsController)
    end

    it "creates a new organization" do
        oc = OrganizationsController.new
        @o = oc.new
        
        expect(@o).to be_a(Organization)
    end

end
