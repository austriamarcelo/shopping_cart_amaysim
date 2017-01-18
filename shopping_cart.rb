class ShoppingCart

	def initialize
		@add_item_from_user = Array.new
		@promo_code = false
		@total_purchased = 0
	end

	def products
		{
			"ult_small" => {"product_code" => "ult_small", "product_name" => "Unlimited 1GB", "price" => 24.90}, 
		  	"ult_medium" => {"product_code" => "ult_medium", "product_name" => "Unlimited 2GB", "price" => 29.90},
			"ult_large" => {"product_code" => "ult_large", "product_name" => "Unlimited 5GB", "price" => 44.90},
			"1gb" => {"product_code" => "1gb", "product_name" => "1 GB Data-pack", "price" => 9.90}		   
		} 
	end

	def add(product, promo_code = nil)
		add_items(product,promo_code)
	end

	def total		
		if @total_purchased > 0
			if @promo_code
				discount = @total_purchased * 0.1
				@total_purchased = @total_purchased - discount
			end

			puts "Total price purchased: $#{@total_purchased.round(2)}"
			return @total_purchased.round(2)
		else
			puts "Check Items first to see total purchase."
			return @total_purchased.round(2)
		end


	end

	def items		
		grouped = @add_item_from_user.group_by {|x| x["product_name"]}		
		grouped.map {|k,v| 	
			total = 0		
			price = v[0]["price"]
			product_code = v[0]["product_code"]

			v.map{|p| 
				total = total + price				
			}

			
			if(v.length > 2 && product_code == "ult_small")
				deal = v.length / 3
				discount = price * deal
				total = total - discount
			elsif(v.length > 3 && product_code == "ult_large")
				new_price = 39.90
				total = (new_price*v.length)
			elsif(product_code == "ult_medium")
				bundle_1gb = "with #{v.length} x 1 GB Data-pack free"
			end

			puts "Items Added: #{v.length} | #{k} #{bundle_1gb || ""}| Total Price: $#{total.round(2)}"
			@total_purchased = (@total_purchased + total)
		}
	end

	private

	def add_items(product, promo_code = nil)
		if products.include?(product)
			@add_item_from_user << products[product]
			puts "Item added to cart #{product} => #{products[product]['product_name']}"

			unless(promo_code.nil?)
				if promo_code == "I<3AMAYSIM"
					@promo_code = true
					puts "Promo Code will apply in total."
				else
					@promo_code = false
					puts "Invalid Promo Code"					
				end
			end
		else
			puts "Invalid Item Code #{product}"
		end
	end

end