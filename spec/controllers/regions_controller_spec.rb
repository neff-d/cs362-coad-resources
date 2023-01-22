require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

    it "exists" do
        rc = RegionsController.new
        expect(rc).to be_a(RegionsController)
    end

    it "authenticates user" do
        rc = RegionsController.new
        expect(rc).to respond_to(:authenticate_user!)
    end
    
    it "has an index method" do
        rc = RegionsController.new
        expect(rc.index).to be_a(ActiveRecord::Relation)
    end

    

    
end
