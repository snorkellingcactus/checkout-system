#!/usr/bin/env ruby

require_relative 'Rule'

class RuleSixtyOrMore < Rule
	def canApply( checkout )
		return @canApply|=( checkout.total_with_rules >= 60 )
	end

	def calcFinalPriceDiff( checkout )
		return -10*( checkout.total_with_rules/100 )
	end

	private :calcFinalPriceDiff
end