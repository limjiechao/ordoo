class IndexController < ApplicationController
  def index
    render json: {
      routes: {
        display_all_orders: 'https://protected-forest-66114.herokuapp.com/orders',
        display_one_order: 'https://protected-forest-66114.herokuapp.com/orders/:id'
      }
    }
  end
end
