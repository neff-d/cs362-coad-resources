require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

    it "exists" do
        oc = OrganizationsController.new
        expect(oc).to be_a(OrganizationsController)
    end

    it "creates a new organization" do
        oc = OrganizationsController.new
        @o = oc.new
        
        expect(@o).to be_a(Organization)
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
            it { expect(get(:index)).to be_successful }
        end

        describe "PATCH #update" do
            let(:organization) { create(:defaultOrganization, :approved) }
            
            it {
                expect_any_instance_of(Organization).to receive(:update).and_return(true)
                patch(:update, params: { id: organization.id, organization: attributes_for(:defaultOrganization) })
                expect(response).to redirect_to organization_path(organization)
            }          
        end

        describe "PUT #update" do
            let(:organization) { create(:defaultOrganization, :approved) }
            
            it {
                expect_any_instance_of(Organization).to receive(:update).and_return(false)
                expect(patch(:update, params: { id: organization.id })).to be_successful
            }
        end
    end

    context "as an admin" do

        let(:user) { create(:defaultUser, :admin) }
        before(:each) { sign_in(user) }

        describe "GET #new" do
            it { expect(get(:new)).to redirect_to(dashboard_path) }
        end

        describe "POST #approve" do
            let(:organization) { create(:defaultOrganization) }

            it {
                expect(post(:approve, params: { id: organization.id })).to redirect_to(organizations_path)
            }

            it {
                expect_any_instance_of(Organization).to receive(:save).and_return(false)
                (post(:approve, params: { id: organization.id }))
            }
        end

        describe "POST #reject" do
            let(:organization) { create(:defaultOrganization) }

            it {
                expect(post(:reject, params: { id: organization.id, organization: attributes_for(:defaultOrganization) } )).to redirect_to(organizations_path)
            }

            it {
                expect_any_instance_of(Organization).to receive(:save).and_return(false)
                expect(post(:reject, params: { id: organization.id, organization: attributes_for(:defaultOrganization) } )).to redirect_to(organization_path)
            }
        end
    end
end
