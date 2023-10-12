class CheckItemTag < ApplicationRecord
  belongs_to :check_item
  belongs_to :tag
end
