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

    context "as a logged-out user" do
        let(:user) { create(:defaultUser) }

        describe "GET #index" do
            it { expect(get(:index)).to redirect_to(new_user_session_path) }
        end
    end

    context "as a logged-in user" do
        let(:user) { create(:defaultUser) }
        before(:each) { sign_in(user) }

        describe "GET #index" do
            it { expect(get(:index)).to redirect_to(dashboard_path)}
        end
    end
    
    context "as an admin" do
        let(:user) { create(:defaultUser, :admin) }
        before(:each) { sign_in(user) }

        describe "GET #index" do
            it { expect(get(:index)).to be_successful}
        end

        describe "GET #new" do
            it { expect(get(:new)).to be_successful}
        end

        describe "POST #create" do

        it {
            post(:create, params: { resource_category: attributes_for(:resource_category) })
            expect(response).to redirect_to(resource_categories_path)
        }

        it {
            expect_any_instance_of(ResourceCategory).to receive(:save).and_return(false)

            post(:create, params: { resource_category: attributes_for(:resource_category) })
            expect(response).to be_successful
        }

        end
    end
end
