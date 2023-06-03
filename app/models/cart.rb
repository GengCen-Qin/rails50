class Cart < ApplicationRecord
  # 购物车内有多个商品，当购物车删除时，对应的lineItem也会被删除
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def total_price
    # prices = 0
    # line_items.each  do |item|
    #   prices += item.total_price
    # end
    # prices
    line_items.to_a.sum { |item| item.total_price }
  end
end
