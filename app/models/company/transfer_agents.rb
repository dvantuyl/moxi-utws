class Company
	class TransferAgents
		class << self

			def call(agents, company_uuid)
				agents
					.select(& allow_transfer?)
					.map(& transfer(company_uuid))
					.each do |agent|
						yield(agent)
					end
			end

			private

			def allow_transfer?
				->(agent) {
					agent[:is_active]
				}
			end

			def transfer(company_uuid)
				->(agent) {
					agent[:company_uuid] = company_uuid
					agent[:transferred_at] = DateTime.now
					agent
				}
			end
		end
	end
end