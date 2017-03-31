#!/usr/bin/env ruby

# I'm a model.
class Product
	attr_reader :name
	attr_reader :price
	attr_reader :code

	def initialize( name , price , code )
		@name=name
		@price=price
		@code=code
	end
end