module Summary
  def total
    line_items.map(&:total).inject(:+)
  end
end