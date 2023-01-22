require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

    it "exists" do
        rcc = ResourceCategoriesController.new
        expect(rcc).to be_a(ResourceCategoriesController)
    end

    it "authenticates user" do
        rcc = ResourceCategoriesController.new
        expect(rcc).to respond_to(:authenticate_user!)
    end

    it "has an index method" do
        rcc = ResourceCategoriesController.new
        expect(rcc.index).to be_a(ActiveRecord::Relation)
    end
end
