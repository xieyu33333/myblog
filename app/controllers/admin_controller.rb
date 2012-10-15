class AdminController < ApplicationController
  def index
    @total_orders = Firstpage.count
  end
end
