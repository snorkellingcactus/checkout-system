#!/usr/bin/env ruby

require_relative 'Rule'

class RuleLavender < Rule

	def reset
		super
		@count=0
		@price=false
	end

	def canApply( checkout )
		if checkout.last_scanned_item.name == 'Lavender heart'
			@count+=1

			!@price && @price=checkout.last_scanned_item.price

			return @canApply|=( @count >= 2 )
		end

		return false
	end

	def calcFinalPriceDiff( checkout )
		return -@count*( @price - 8.50 )
	end

	private :calcFinalPriceDiff
end