require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
    let(:user) { create :defaultUser }
  
    describe "After sign-in" do
      it "redirects to the /dashboard" do
        expect(subject.after_sign_in_path_for(user)).to eq(dashboard_path)
      end
  end
end