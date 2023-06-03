class ProductsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "products"
  end

  def unsubscribed
    # 取消频道订阅时所需要的清理工作
  end
end
