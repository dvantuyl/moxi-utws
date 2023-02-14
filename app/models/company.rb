class Company < ApplicationRecord

	def transfer_agents(agents)

		# allow transfer to company?
		valid_agents = agents.select do |agent|
				agent[:is_active] 
		end

		# update to company 
		valid_agents.each do |agent|
				agent.company_uuid = self.uuid
				agent.transferred_at = DateTime.now
				agent.save!
		end

	end
end
