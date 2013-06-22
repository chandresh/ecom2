class Basket < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items
  include Summary

  def add_line_item_for(product)
    product_line_items = line_items.where(product_id: product.id)
    if product_line_items.count > 0
      line_item = product_line_items.last
      line_item.quantity += 1
    else
      line_item = line_items.new(product_id: product.id, quantity: 1, price: product.price)
    end
    line_item.save
  end

end
