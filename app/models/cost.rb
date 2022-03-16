class Cost < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :kind, optional: true
  
  validates :date, presence: true
  validates :cost, numericality: {presence: true, only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 9999999}
  
end
