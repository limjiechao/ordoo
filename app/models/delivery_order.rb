class DeliveryOrder < ApplicationRecord
  has_many :order_items
  validates :order_id, uniqueness: true, allow_nil: true
  after_save :create_order_id, :create_serving_datetime


  private

  def create_order_id
    # Create `order_id` by adding prefix 'GO' to `id`
    update_column(:order_id, self.order_id = "GO#{id}")
  end

  def create_serving_datetime
    # Create `serving_datetime`
    update_column(:serving_datetime, self.serving_datetime = updated_at)
  end
end
