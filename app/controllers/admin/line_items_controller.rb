class Admin::LineItemsController < Admin::AdminController

  def index
    @order = Order.find(params[:order_id])
  end
end
