#!/usr/bin/env ruby

require_relative 'Checkout'
require_relative 'Rule/RuleLavender'
require_relative 'Rule/RuleSixtyOrMore'

require_relative 'Product/ProductLavenderHeart'
require_relative 'Product/ProductPersCuff'
require_relative 'Product/ProductKidsT'

def new_checkout()

return Checkout.new( [
		RuleLavender.new(),
		RuleSixtyOrMore.new()
	]
)

end

# Test data
# ---------

# Basket: 001,002,003
# Total price expected: $66.78

co=new_checkout()

co.scanItem( ProductLavenderHeart.new() )
co.scanItem( ProductPersCuff.new() )
co.scanItem( ProductKidsT.new() )

puts co.total

# Basket: 001,003,001
# Total price expected: $36.95
co=new_checkout()

co.scanItem( ProductLavenderHeart.new() )
co.scanItem( ProductKidsT.new() )
co.scanItem( ProductLavenderHeart.new() )

puts co.total

# Basket: 001,002,001,003
# Total price expected: $73.76
co=new_checkout()

co.scanItem( ProductLavenderHeart.new() )
co.scanItem( ProductPersCuff.new() )
co.scanItem( ProductLavenderHeart.new() )
co.scanItem( ProductKidsT.new() )

puts co.total
