class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_details
  accepts_nested_attributes_for :order_details, allow_destroy: true
end
