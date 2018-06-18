class Search < ApplicationRecord

	def search_destinations
		
		destinations = Destination.all

		destinations = destinations.where(["place LIKE ?", "%#{keywords}%"]) if keywords.present?
		destinations = destinations.where(["filter LIKE ?", filter]) if filter.present?

		return destinations
	end

	def search_deals
		
		deals = Deal.all

		deals = deals.where(["place LIKE ?", "%#{keywords}%"]) if keywords.present?
		deals = deals.where(["category LIKE ?", category]) if category.present?
		deals = deals.where(["price >= ?", min_price]) if min_price.present?
		deals = deals.where(["price <= ?", max_price]) if max_price.present?

		return deals
	end

end
