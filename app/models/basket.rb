class Basket < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items


  def total
    line_items.map(&:total).inject(:+)
  end

end
