#!/usr/bin/env ruby

require_relative 'CheckoutObject.rb'

class Checkout < CheckoutObject
	attr_reader :total_with_rules
	attr_reader :last_scanned_item

	def reset
		@total_with_rules=0
	end

	def initialize( rules )
		super()
		@rules=rules
	end

	def calcFinalPriceDiff( checkout )
		return @total_with_rules
	end

	def getFinalPriceDiff()
		for rule in @rules
			@total_with_rules+=rule.getFinalPriceDiff( self )
		end

		return super( self )
	end

	def total
		return Float ( sprintf( '%.2f', getFinalPriceDiff ) )
	end

	def scanItem( item )
		@last_scanned_item=item
		@total_with_rules+=item.price

		for rule in @rules
			rule.canApply( self )
		end
	end

	private :getFinalPriceDiff
	private :calcFinalPriceDiff
	private :reset
end