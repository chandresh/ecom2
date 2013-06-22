class Order < ActiveRecord::Base
  attr_accessible :address, :name
  include Summary
  has_many :line_items

  def fetch_line_items_from(cart)
    self.line_items = cart.line_items
    cart.line_items.delete_all
  end

end
