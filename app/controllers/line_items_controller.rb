class LineItemsController < ApplicationController
  def update
    @line_item = LineItem.find(params[:id])
    @line_item.update_attributes(params[:line_item])
    redirect_to current_cart, notice: "Updated the quantity"
  end

  def create
    # grab the current_cart
    product = Product.find(params[:product_id])

    ## first check if the cart already has the product
    @cart_line_items = current_cart.line_items.where(product_id: product.id)
    if @cart_line_items.count > 0
      @line_item = @cart_line_items.last
      @line_item.quantity += 1
    else
      @line_item = current_cart.line_items.new(product_id: product.id, quantity: 1, price: product.price)
    end

    if @line_item.save
      redirect_to current_cart, notice: "Product Added successfully."
    else
      redirect_to root_url, notice: "Some error, please try adding product again."
    end
  end
end
