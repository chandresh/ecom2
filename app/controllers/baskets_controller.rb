class BasketsController < ApplicationController
  def show
    @cart = current_cart
  end
end
