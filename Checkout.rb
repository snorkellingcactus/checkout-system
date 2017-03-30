#!/usr/bin/env ruby

class Checkout
	attr_reader :total_with_rules
	attr_reader :last_scanned_item
	attr_writer :rules

	def initialize( rules )
		@rules=rules
		@total_with_rules=0
	end

	def total

		for rule in @rules
			@total_with_rules+=rule.getFinalPriceDiff( self )
			rule.reset
		end

		result=Float ( sprintf( '%.2f', @total_with_rules ) )

		@total_with_rules=0

		return result
	end

	def scanItem( item )
		@last_scanned_item=item
		@total_with_rules+= item.price

		for rule in @rules
			rule.canApply( self )
		end
	end
end