class LineItemsController < ApplicationController
  def update
    @line_item = LineItem.find(params[:id])
    @line_item.update_attributes(params[:line_item])
    redirect_to current_cart, notice: "Updated the quantity"
  end

  def create
    product = Product.find(params[:product_id])
    current_cart.add_line_item_for(product)
    redirect_to current_cart, notice: "Product added successfully."
  end
end
