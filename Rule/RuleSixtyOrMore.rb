#!/usr/bin/env ruby

require_relative 'Rule'

class RuleSixtyOrMore < Rule

	def canApply( checkout )
		return ( checkout.total ) >= 60;
	end

	def calcTenPercent( price )
		return -10*(price/100)
	end

	def getFirstPriceDiff( checkout )
		return calcTenPercent( checkout.total )
	end
	
	def getLatterPriceDiff( checkout )
		return calcTenPercent( checkout.last_scanned_item.price )
	end

	private :canApply
	private :getFirstPriceDiff
	private :getLatterPriceDiff
	private :calcTenPercent
end