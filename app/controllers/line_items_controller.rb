class LineItemsController < ApplicationController
  def create
    # grab the current_cart
    product = Product.find(params[:product_id])
    @line_item = current_cart.line_items.new(product_id: product.id)
    if @line_item.save
      redirect_to current_cart, notice: "Product Added successfully."
    else
      redirect_to root_url, notice: "Some error, please try adding product again."
    end
  end
end
