class DeliveryOrder < ApplicationRecord
  has_many :order_items
  validates :order_id, uniqueness: true, allow_nil: true
  after_save :create_order_id

  private
  
  def create_order_id
    # Create `order_id` by adding prefix 'GO' to `id`
    update_column(:order_id, self.order_id = "GO#{id}")
  end
end
