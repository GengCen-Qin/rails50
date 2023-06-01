class LineItem < ApplicationRecord
  # 表明 一个LineItem 既属于商品，又属于购物车，两者缺一不可
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end
end
