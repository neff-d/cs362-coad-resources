require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    it "exists" do
        r = ResourceCategory.new
        expect(r).to be_a(ResourceCategory)
       end

end
