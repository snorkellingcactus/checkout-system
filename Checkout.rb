#!/usr/bin/env ruby

class Checkout
	attr_reader :total_with_rules
	attr_reader :last_scanned_item
	attr_writer :rules

	def initialize( rules )
		@rules=rules

		@items=[]
		
		@total=0
	end

	def calcTotal()
		@total_with_rules=0

		for rule in @rules
			rule.reset
		end

		for item in @items
			@last_scanned_item=item
			@total_with_rules+= item.price

			for rule in @rules
				rule.canApply( self )
			end
		end

		for rule in @rules
			@total_with_rules+=rule.getFinalPriceDiff( self )
		end

		return @total_with_rules
	end

	def total
		return Float ( sprintf( '%.2f', calcTotal ) )
	end

	def scanItem( item )
		@items.push( item )
	end

	private :calcTotal
end