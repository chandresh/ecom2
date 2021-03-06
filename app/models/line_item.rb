class LineItem < ActiveRecord::Base
  attr_accessible :basket_id, :price, :product_id, :quantity
  belongs_to :product

  def total
    quantity * product.price
  end

end
