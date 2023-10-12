class CheckItem < ApplicationRecord
  has_many :check_item_tags
  has_many :tags, through: :check_item_tags
end
