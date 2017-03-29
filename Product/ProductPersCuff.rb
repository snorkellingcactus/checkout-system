#!/usr/bin/env ruby

require_relative 'Product'

class ProductPersCuff < Product
	def initialize
		super( 'Personalised cufflinks', 45.00, 2 )
	end
end