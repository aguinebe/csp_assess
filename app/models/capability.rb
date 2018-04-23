class Capability < ApplicationRecord
	has_many :plan_capabilities
	belongs_to :subcategory

	def fulldesc
		"#{level}. #{description}"
	end
end
