require 'rails_helper'

RSpec.describe User, type: :model do

    it "exists" do
        User.new
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

end
