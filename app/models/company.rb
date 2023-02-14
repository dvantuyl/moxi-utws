class Company < ApplicationRecord

	def transfer_agents(agents)
		TransferAgents.call(agents, uuid) do |agent|
			agent.save!
		end
	end
end
