#!/usr/bin/env ruby

require_relative '../CheckoutObject.rb'

class Rule < CheckoutObject
	def reset
		@canApply=false
	end

	def getFinalPriceDiff( checkout )
		if @canApply == false
				reset
				
				return 0
		end

		return super
	end

	protected :reset
end