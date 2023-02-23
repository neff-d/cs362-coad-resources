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

    it "creates a new region" do
        rc = RegionsController.new
        r = rc.new
        expect(r).to be_a(Region)
    end

    context 'as a logged-in user' do
        let(:user) { create(:defaultUser) }
        before(:each) { sign_in(user) }

        describe "GET #index" do
            it { expect(get(:index)).to redirect_to(dashboard_path) }
        end

        describe "GET #show" do
            let(:region) { create(:region) }
            it { expect(get(:show, params: { id: region.id } )).to redirect_to(dashboard_path) }
        end

     end

    context 'as a logged-out user' do
        let(:user) { create(:defaultUser) }
        
        describe "GET #index" do
            it { expect(get(:index)).to redirect_to(new_user_session_path) }
        end

    end

    context 'as an admin' do
        let(:user) { create(:defaultUser, :admin) }
        before(:each) { sign_in(user) }

        describe "GET #index" do
            it { expect(get(:index)).to be_successful }
        end

        describe "GET #show" do
            let(:region) { create(:region) }
            it { expect(get(:show, params: { id: region.id } )).to be_successful }
        end

        describe "POST #create" do

            it {
                  post(:create, params: { region: attributes_for(:region) })
                  expect(response).to redirect_to(regions_path)
            }

            it {
                expect_any_instance_of(Region).to receive(:save).and_return(false)

                post(:create, params: { region: attributes_for(:region) })
                expect(response).to be_successful
            }            
        end

        describe "GET #edit" do

            let(:region) { create(:region) }
            it { expect(get(:edit, params: {id: region.id } )).to be_successful }
        end

        describe "PATCH #update" do

            let(:region) { create(:region) }

            it {               
                expect(patch(:update, params: { id: region.id, region: attributes_for(:region) } )).to redirect_to(@region)
            }           
        end

        describe "PUT #update" do

            let(:region) { create(:region) }

            it {
                expect_any_instance_of(Region).to receive(:update).and_return(false)
                expect(patch(:update, params: { id: region.id, region: attributes_for(:region) } )).to be_successful
            }
        end

        describe "DELETE #destroy" do
            let(:region) { create(:region) }

            it {
                delete(:destroy, params: { id: region.id })
                expect(response).to redirect_to(regions_path)
            }
        end
    end


    

    
end
