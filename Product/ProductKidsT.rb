#!/usr/bin/env ruby

require_relative 'Product'

class ProductKidsT < Product
	def initialize
		super( 'Kids T-shirt', 19.95, 3 )
	end
end