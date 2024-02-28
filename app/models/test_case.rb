class TestCase < ApplicationRecord
  has_and_belongs_to_many :test_case_tags

  validates :name, presence: true

  def self.by_tag(tag)
    TestCaseTag.find_by_tag(tag).test_cases
  end

  def self.in_test
    where(to_test: true)
  end

  def self.categories
    distinct.pluck(:category)
  end
end
