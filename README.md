# shopping_cart_amaysim

<table>
	<tr>
		<td>Product Code</td>
		<td>Product Name</td>
		<td>Product Code</td>
	</tr>
	<tr>
		<td>ult_small</td>
		<td>Unlimited 1GB</td>
		<td>$24.90</td>
	</tr>
	<tr>
		<td>ult_medium</td>
		<td>Unlimited 2GB</td>
		<td>$29.90</td>
	</tr>
	<tr>
		<td>ult_large</td>
		<td>Unlimited 5GB</td>
		<td>$44.90</td>
	</tr>
	<tr>
		<td>1gb</td>
		<td>1 GB Data-pack</td>
		<td>$9.90</td>
	</tr>
</table>
<hr>

## Instruction

```ruby
cd shopping_cart_amaysim
irb
load 'shopping_cart.rb'
cart = ShoppingCart.new
cart.add('ult_small')
cart.add('1gb', 'I<3AMAYSIM')
cart.items
cart.total

```
## Test Instruction

```ruby
irb test_shopping_cart.rb

```