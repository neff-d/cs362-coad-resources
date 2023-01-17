require 'rails_helper'



RSpec.describe Organization, type: :model do

    it "exists" do
       o = Organization.new
       expect(o).to be_a(Organization)
      end

    it "has a name" do
        organization = Organization.new
        expect(organization).to respond_to(:name)
      end
    
    it "has a string representation that is its name" do
        name = 'Mt. Hood'
        organization = Organization.new(name: name)
        result = organization.to_s
        expect(result).to eq(name)
      end
    it "is submitted" do
        organization = Organization.new()
        expect(organization.status).to eq("submitted")
    end
    it "is approved" do
        organization = Organization.new()
        organization.approve
        expect(organization.status).to eq("approved")
    end
    it "is rejected" do
        organization = Organization.new()
        organization.reject
        expect(organization.status).to eq("rejected")
    end

end
