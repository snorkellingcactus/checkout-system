#!/usr/bin/env ruby

# It is supposed to be a model in real life.
class Product
	attr_accessor :name
	attr_accessor :price
	attr_accessor :code

	def initialize( name , price , code )
		@name=name
		@price=price
		@code=code
	end
end