#!/usr/bin/env ruby

require_relative 'Rule'

class RuleLavender < Rule
	def initialize
			super
			@count=0
	end

	def canApply( checkout )
		if checkout.last_scanned_item.name == 'Lavender heart'
			@count+=1

			return @count >= 2
		end

		return false
	end

	def getFirstPriceDiff( checkout )
		return 2*getLatterPriceDiff( checkout )
	end
	def getLatterPriceDiff( checkout )
		return -( checkout.last_scanned_item.price - 8.50 )
	end

	private :getLatterPriceDiff
	private :getFirstPriceDiff
end