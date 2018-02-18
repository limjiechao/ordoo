class OrdersController < ApplicationController
  def index
    @orders = DeliveryOrder.all.map do |order|
      order_details(order)
    end

    render json: { orders: @orders }
  end

  def show
    @order = order_details(DeliveryOrder.find(params[:id]))
    @items = OrderItem.where(delivery_order: params[:id]).map do |item|
      {
        name: Meal.find(item.meal_id).name,
        quantity: item.quantity,
        total_price: item.quantity * item.unit_price
      }
    end
    @order[:order_items] = @items

    render json: { order: @order }
  end

  private

  def order_details(order)
    datetime = DateTime.parse(order.serving_datetime.to_s).localtime

    {
      order_id: order.id,
      delivery_date: datetime.strftime('%F'),
      delivery_time: "#{datetime.strftime('%I:%M')}-#{(datetime + 30.minutes).strftime('%I:%M%p')}"
    }
  end
end
