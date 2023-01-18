require 'rails_helper'

RSpec.describe User, type: :model do

    it "exists" do
            u = User.new
            expect(u).to be_a(User)
      end
    
    
      it "has an email" do
        email = 'example@example.com'
        user = User.new(email: email)
        result = user.to_s
        expect(result).to eq(email)
      end
    
    it "defaults to organization" do
        user = User.new()
        expect(user.role).to eq("organization")
    end

    it "has an email with at least 1 character" do
        u = User.new
        u.email = "i" * 0
        expect(u).to_not be_valid
    end

    it "has an email with less than 256 characters" do
      u = User.new
      u.email = "i" * 256
      expect(u).to_not be_valid
  end

    it {should belong_to(:organization).class_name('Organization')}
end
