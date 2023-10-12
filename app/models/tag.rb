class Tag < ApplicationRecord
  has_many :check_item_tags
  has_many :check_items, through: :check_item_tags
end
