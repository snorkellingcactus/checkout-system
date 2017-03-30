#!/usr/bin/env ruby

#gem 'minitest-spec-context'
#gem 'minitest-context'

#require 'minitest/context'
#require 'minitest-spec-context'

require 'minitest/autorun'

require_relative 'Checkout'
require_relative 'Rule/RuleLavender'
require_relative 'Rule/RuleSixtyOrMore'

require_relative 'Product/ProductLavenderHeart'
require_relative 'Product/ProductPersCuff'
require_relative 'Product/ProductKidsT'

describe Checkout do
	describe "test_examples" do
		items={
			"001"=> ProductLavenderHeart.new(),
			"002"=> ProductPersCuff.new(),
			"003"=> ProductKidsT.new()
		}

		examples=[
			[ "001", "002", "003" ],
			[ "001", "003", "001" ],
			[ "001", "002", "001", "003" ],
			[ "001", "002", "001", "003", "001" ]
		]

		results=[ 66.78, 36.95, 73.76, 81.40 ]

		before do
			@co=Checkout.new(
					[
						RuleLavender.new(),
						RuleSixtyOrMore.new()
				]
			)
		end

		examples.each_with_index do | example , example_number |
			basket=''
			for code in example
				basket+="#{code},"
			end
			basket=basket.chomp( "," )

			describe "Basket #{ basket }" do
				before do
					for code in example
						@co.scanItem( items[code] )
					end
				end
				it "Has the expected price" do
					@co.total.must_equal results[ example_number ]
				end
			end
		end
	end
end