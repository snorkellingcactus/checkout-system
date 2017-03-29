#!/usr/bin/env ruby

require_relative 'Product'

class ProductLavenderHeart < Product
	def initialize
		super( 'Lavender heart', 9.25, 1 )
	end
end