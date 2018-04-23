class PlanCapability < ApplicationRecord
	belongs_to :capability, :optional => true
	belongs_to :subcategory
end
