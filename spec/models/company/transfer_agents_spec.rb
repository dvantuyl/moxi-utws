require 'rails_helper'

RSpec.describe Company::TransferAgents do
	let(:company_uuid) { '1234567' }
	let(:agents) { 
		build_list(:agent, 2, is_active: true, transferred_at: nil, company_uuid: '111111')
	}

  describe '#transfer_agents' do
		let(:agents) { 
			build_list(:agent, 2, is_active: true, transferred_at: nil, company_uuid: '111111')
		}

    it 'transfers the agents to the company' do
			described_class.call(agents, '1234567') do |agent|
        expect(agent.company_uuid).to eq(company_uuid)
        expect(agent.transferred_at).not_to be_nil
			end
    end

    it 'only transfers active agents' do
			agents[0][:is_active] = false

			described_class.call([agents[0]], '1234567') do |agent|
        expect(agent.company_uuid).not_to eq(company_uuid)
        expect(agent.transferred_at).to be_nil
			end
    end
  end
end