#!/usr/bin/env ruby

class ShoppingCart 

	#initialize pricing rule
	def initialize 
		@grand_total = 0
		@list_item = []
		@pcode=""
    	@price_rule = {
			 "ult_small"  => {:code => "ult_small", :name => "Unlimited 1 GB", :price => 24.90},
     		 "ult_medium" => {:code => "ult_medium", :name => "Unlimited 2 GB", :price => 29.90},
     		 "ult_large"  => {:code => "ult_large", :name => "Unlimited 5 GB", :price => 44.90},
     		 "1gb" 		  => {:code => "1gb", :name => "1 GB Data-pack", :price => 9.90}
     		}	
	end

	#adding item and promo code
  	def add(item_code, promo_code=nil)
  		if @price_rule.include?(item_code)
			@list_item << @price_rule["#{item_code}"]
			puts "Item added to cart #{item_code} => #{@price_rule["ult_small"][:name]}"
			puts @list_item
			unless promo_code.nil?
				if promo_code == "I<3AMAYSIM"
				   @pcode = "accepted"
					puts "Promo Code applied."
				else
					puts "Invalid Promo Code #{promo_code} entered"					
				end
			end
		else
			puts "Invalid Item Code #{item_code} entered"
		end
 	end

 	# list of item
 	def items
 		cart = @list_item.group_by {|item| item[:name]} 
 		cart.map {|k,v| 	
			@total = 0		
			price = v[0][:price]
			code = v[0][:code]
			v.map{|p| @total = @total + price}
	
			if(v.length > 2 && code == "ult_small")
				disc = ((v.length / 3) * price)
				@total = @total - disc
			elsif(v.length > 3 && code == "ult_large")
				new_price = 39.90
				@total = (new_price * v.length)
			elsif(code == "ult_medium")
				bundle_1gb = "with #{v.length} x 1 GB Data-pack free"
			end
			@grand_total = @grand_total + @total
			puts  "Items Added: #{v.length} | #{k} #{bundle_1gb || ""}| Total Price: $#{@total.round(2)}"
			}
 	end

 	# grand Total
	def total		
		if @pcode == "accepted"
			@grand_total = (@grand_total - (@grand_total * 0.1) )
		end			
		puts "Grand Total purchased: $#{@grand_total.round(2)}"
	end
end

