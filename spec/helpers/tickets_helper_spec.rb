require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper, type: :helper do

    it 'exists' do
        expect(TicketsHelper.inspect).to eq('TicketsHelper')
    end

    it 'handles phone numbers' do
        n = '5033334444'
        expect(helper.format_phone_number(n)).to eq('+15033334444')
    end
end
