class TestCase < ApplicationRecord
  has_and_belongs_to_many :test_case_tags
end
