#!/usr/bin/env ruby

class Rule
	def initialize
		@first_calculation=true
	end

	def getPriceDiff( checkout )
			if canApply( checkout )
				if @first_calculation
					@first_calculation=false

					return getFirstPriceDiff( checkout )
				else
					return getLatterPriceDiff( checkout )
				end
			end
			return 0
	end
end