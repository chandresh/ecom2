class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      @order.fetch_line_items_from(current_cart)

      session[:order_id] = @order.id

      redirect_to @order
    else
      render :new
    end
  end

  def show
    @order = Order.find(session[:order_id])
  end

end
