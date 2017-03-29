#!/usr/bin/env ruby

class Checkout
	attr_accessor :total
	attr_accessor :last_scanned_item

	def initialize( rules )
		@items=[]
		@rules=rules
		@total=0
	end

	def sumTotal( price )
		@total+=price
	end

	def scanItem( item )
		@last_scanned_item=item

		sumTotal( item.price )

		for rule in @rules
			sumTotal( rule.getPriceDiff( self ) )
		end
	end

	private :sumTotal
end