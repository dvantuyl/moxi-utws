require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { create(:company, uuid: '1234567') }
  let(:agents) { 
    create_list(:agent, 2, is_active: true, transferred_at: nil, company_uuid: '111111')
  }

  describe '#transfer_agents' do
    it 'transfers the agents to the company' do

      company.transfer_agents(agents)

      agents.each do |agent|
        expect(agent.reload.company_uuid).to eq(company.uuid)
        expect(agent.reload.transferred_at).not_to be_nil
      end
    end

    it 'only transfers active and valid agents' do
      agents[0][:is_active] = false

      company.transfer_agents(agents)

      expect(agents[0].reload.company_uuid).not_to eq(company.uuid) 
      expect(agents[1].reload.company_uuid).to eq(company.uuid)
    end
  end
end