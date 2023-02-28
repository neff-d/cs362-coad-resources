require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    it "exists" do
        tc = TicketsController.new
        expect(tc).to be_a(TicketsController)
    end

    it "creates a new ticket" do 
        testparams = { :ticket => { :title => "Test Ticket", :phone => "9715555555", :description => "test desc", :region_id => "1", :resource_category_id => "1"} }
       
        expect(post(:create, :params => testparams)).to be_successful
    end 

    it "saves a new ticket" do
        testparams = { ticket: attributes_for(:defaultTicket) }

        expect_any_instance_of(Ticket).to receive(:save).and_return(true)

        expect(post(:create, :params => testparams)).to redirect_to(ticket_submitted_path)
    end

    context "when signed out" do
        before(:each) do
            @u = create(:defaultUser)
            @ticketid = create(:defaultTicket).id
        end

        it "create redirects to dashboard" do
            #create ticket
            allow(@controller).to receive(:current_user).and_return(@u)

            expect(get(:show, :params => { :id => @ticketid })).to redirect_to(dashboard_path)
        end

        it "capture redirects to dashboard" do
            #capture ticket
            allow(@controller).to receive(:current_user).and_return(@u)

            expect(put(:capture, :params => { :id => @ticketid })).to redirect_to(dashboard_path)
        end

        it "release redirects to dashboard" do
            #release ticket
            allow(@controller).to receive(:current_user).and_return(@u)

            expect(put(:release, :params => { :id => @ticketid })).to redirect_to(dashboard_path)
        end

        it "close redirects to dashboard" do
            #close ticket
            allow(@controller).to receive(:current_user).and_return(@u)

            expect(put(:close, :params => { :id => @ticketid })).to redirect_to(dashboard_path)
        end

    end

    context "when signed in" do
        before(:each) do
            
            @u = create(:defaultUser)
            @u.organization.approve
            
            @ticketid = create(:defaultTicket).id
        end


        it "shows tickets" do

            allow(@controller).to receive(:current_user).and_return(@u)


            expect(get(:show, :params => { :id => @ticketid })).to be_successful
        end

        it "captures tickets" do
                
                allow(@controller).to receive(:current_user).and_return(@u)
    
                expect(put(:capture, :params => { :id => @ticketid })).to redirect_to('http://test.host/dashboard#tickets:open')
        end

        it "fails to capture tickets" do
            fakeid = create(:defaultTicket2).id

            allow(@controller).to receive(:current_user).and_return(@u)


            expect(put(:capture, :params => { :id => fakeid })).to be_successful
        end

        it "releases tickets" do
            allow(@controller).to receive(:current_user).and_return(@u)

            expect(put(:release, :params => { :id => @ticketid })).to be_successful
        end
    

        it "release tickets for admin" do
            a = create(:adminUser)
            @u.organization.approve
            allow(a).to receive(:organization).and_return(@u.organization)

            allow(@controller).to receive(:current_user).and_return(a)

            expect(put(:release, :params => { :id => @ticketid })).to redirect_to('http://test.host/dashboard#tickets:captured')
        
        end

        it "release ticket for user" do
            @u.organization.approve
            allow(@controller).to receive(:current_user).and_return(@u)
            allow(TicketService).to receive(:release_ticket).and_return(:ok)

            expect(put(:release, :params => { :id => @ticketid })).to redirect_to('http://test.host/dashboard#tickets:organization')
        end

        it "close tickets" do
            allow(@controller).to receive(:current_user).and_return(@u)

            expect(put(:close, :params => { :id => @ticketid })).to redirect_to('http://test.host/dashboard#tickets:organization')
        end

        it "close tickets for admin" do
            a = create(:adminUser)
            @u.organization.approve
            allow(a).to receive(:organization).and_return(@u.organization)

            allow(@controller).to receive(:current_user).and_return(a)

            expect(put(:close, :params => { :id => @ticketid })).to redirect_to('http://test.host/dashboard#tickets:open')
        end

        it "fails to close tickets" do
            fakeid = create(:defaultTicket2).id

            allow(@controller).to receive(:current_user).and_return(@u)

            expect(put(:close, :params => { :id => fakeid })).to be_successful
        end

        it "allows admin to destroy tickets" do
            a = create(:adminUser)
    
            allow(@controller).to receive(:current_user).and_return(a)
    
            expect(delete(:destroy, :params => { :id => @ticketid })).to redirect_to('http://test.host/dashboard#tickets')
        end
    end
end
