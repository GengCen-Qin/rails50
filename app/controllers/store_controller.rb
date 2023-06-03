class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
    @current_time = Time.now
    @counter = session[:counter]
  end

  private

  def calculate_user_counter
    if session[:counter].nil?
      session[:counter] = 1;
    else
      session[:counter] += 1;
    end
  end
end
