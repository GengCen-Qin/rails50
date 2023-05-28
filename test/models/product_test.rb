require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # 指定固件，这里会在测试前清空测试数据库，并导入 products.yml中的数据
  fixtures :products
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product title must be unique" do
    product = Product.new(title: products(:ruby).title,
                          description: "this is beauty",
                          image_url: "ruby.jpg",
                          price: 10.01);
    assert product.invalid?
    assert_equal ["has already been taken"],product.errors[:title]
  end

  test "product title must be unique - i18n" do
    product = Product.new(title: products(:ruby).title,
                          description: "this is beauty",
                          image_url: "ruby.jpg",
                          price: 10.01);
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],product.errors[:title]
  end
end
