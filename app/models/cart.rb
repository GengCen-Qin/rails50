class Cart < ApplicationRecord
  # 购物车内有多个商品，当购物车删除时，对应的lineItem也会被删除
  has_many :line_items,dependent: :destroy
end
