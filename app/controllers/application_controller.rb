class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_cart
    if session[:cart_id].present?
      @cart ||= Basket.find(session[:cart_id])
    else
      @cart = Basket.create
      session[:cart_id] = @cart.id
    end
    @cart
  end

  helper_method :current_cart

end
