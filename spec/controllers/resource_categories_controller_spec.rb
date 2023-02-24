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

        describe "PATCH #update" do

            let(:resource_category) { create(:resource_category) }

            it {
                expect(patch(:update, params: { id: resource_category.id, resource_category: attributes_for(:resource_category) } )).to redirect_to(@resource_category)
            }
        end

        describe "PUT #update" do

            let(:resource_category) { create(:resource_category) }

            it {
                expect_any_instance_of(ResourceCategory).to receive(:update).and_return(false)
                expect(patch(:update, params: { id: resource_category.id, resource_category: attributes_for(:resource_category) } )).to be_successful
            }

        end

        describe "PATCH #activate" do

            let(:resource_category) { create(:resource_category) }

            it { 
                patch(:activate, params: { id: resource_category.id } )
                expect(:notice).to eq(:notice) { 'Category activated.' }
            }

            it {
                expect_any_instance_of(ResourceCategory).to receive(:activate).and_return(false)

                patch(:activate, params: { id: resource_category.id } )
                expect(:alert).to eq(:alert) { 'There was a problem activating the category.'}
            }

        end

        describe "PATCH #deactivate" do

            let(:resource_category) { create(:resource_category) }

            it {
                patch(:deactivate, params: { id: resource_category.id } )
                expect(:notice).to eq(:notice) { 'Category deactivated.' }
            }

            it {
                expect_any_instance_of(ResourceCategory).to receive(:deactivate).and_return(false)

                patch(:deactivate, params: { id: resource_category.id } )
                expect(:alert).to eq(:alert) { 'There was a problem deactivating the category.' }
            }

        end

        describe "DELETE #destroy" do

            let(:resource_category) { create(:resource_category) }

            it {
                delete(:destroy, params: { id: resource_category.id } )
                expect(response).to redirect_to(resource_categories_path)
            }
        end
    end
end
