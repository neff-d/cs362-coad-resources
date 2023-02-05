require 'rails_helper'

RSpec.describe User, type: :model do

    it "exists" do
            u = User.new
            expect(u).to be_a(User)
      end
    
    
      it "has an email" do
        user = create(:defaultUser)
        result = user.email.to_s
        expect(result).to eq('example@example.com')
      end

      it "has a password" do
        password = 'password'
        user = create(:defaultUser)
        result = user.password.to_s
        expect(result).to eq(password)
      end

    it "defaults to organization" do
        user = create(:defaultUser)
        expect(user.role).to eq("organization")
    end

    it "has an email with at least 1 character" do
        u = create(:defaultUser)
        u.email = "i" * 0
        expect(u).to_not be_valid
    end

    it "has an email with less than 256 characters" do
      u = create(:defaultUser)
      u.email = "i" * 256
      expect(u).to_not be_valid
 `` end
      
    it "has a password with at least 7 characters" do
        u = create(:defaultUser)
        u.password = 'abc'
        expect(u).to_not be_valid
    end

    it "has a password with less than 256 characters" do
        u = create(:defaultUser)
        u.password = "i" * 256
        expect(u).to_not be_valid
    end
    

    it {should belong_to(:organization).class_name('Organization')}
    it {should validate_length_of(:password).is_at_least(7)}
    it {should validate_length_of(:password).is_at_most(255)}
    it {should validate_length_of(:email).is_at_least(1)}
    it {should validate_length_of(:email).is_at_most(255)}
    
end
