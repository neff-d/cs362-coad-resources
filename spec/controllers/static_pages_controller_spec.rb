require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

    it "exists" do
        spc = StaticPagesController.new
        expect(spc).to be_a(StaticPagesController)
    end

end
