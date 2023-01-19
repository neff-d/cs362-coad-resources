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
    
    it "has a description" do
        organization = Organization.new
        organization.description = "abcdefg1234567"
        result = organization.description.to_s
        expect(result).to eq(organization.description)
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


    it {should have_many(:tickets).class_name('Ticket')}
    it {should have_many(:users).class_name('User')}
    it {should have_and_belong_to_many(:resource_categories).class_name('ResourceCategory')}
    it {should validate_length_of(:description).is_at_most(1020)}
    
end
