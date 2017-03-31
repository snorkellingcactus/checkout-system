#!/usr/bin/env ruby

require_relative '../CheckoutObject.rb'

class Rule < CheckoutObject
	def reset()
		puts "Called in #{self.class.name}"
		@canApply=false
	end

	def getFinalPriceDiff( checkout )
		if @canApply == false
				return 0
		end

		super( checkout )
	end

	protected :reset
end