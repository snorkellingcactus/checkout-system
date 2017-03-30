#!/usr/bin/env ruby

class Rule
	def reset()
		@canApply=false
	end

	def initialize
		reset
	end

	def getFinalPriceDiff( checkout )
			if @canApply
				return calcFinalPriceDiff( checkout )
			end

			return 0
	end

	protected :initialize
end