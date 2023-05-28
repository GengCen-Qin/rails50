class Product < ApplicationRecord
  # 非空
  validates :title, :description, :image_url, presence: true
  # 必须为金额，且大于0.01，因为数据库金额存小数点后两位，所以如果前端发送0.0001，可以通过校验，但存在数据库为0
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  # 唯一
  validates :title, uniqueness: true
  # 图片格式校验
  validates :image_url, allow_blank: true ,format: {
    with: %r{\.{gif|jpg|png}\Z}i,
    message: "format your image,only for git,jpg,png"
  }
  has_many :line_items

  # 钩子函数，在销毁前，需要判断是否仍被购物车内的商品引用，如果仍有引用，则抛出abort，记录不会被删除
  before_destroy :ensure_not_referenced_by_any_line_item
  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
