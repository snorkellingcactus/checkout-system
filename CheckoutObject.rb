#!/usr/bin/env ruby

class CheckoutObject
	def initialize
		reset
	end

	def getFinalPriceDiff( checkout )
		price_diff=calcFinalPriceDiff( checkout )

		reset

		return price_diff
	end

	protected :initialize
	protected :getFinalPriceDiff
end