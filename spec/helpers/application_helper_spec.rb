require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

    it 'exists' do
        expect(ApplicationHelper.inspect).to eq('ApplicationHelper')
    end


    it 'titles the page' do
        expect(helper.full_title('test')).to eq('test | Disaster Resource Network')
    end

end
