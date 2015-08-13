class Game < ActiveRecord::Base

  validates :date, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  has_many :payments, dependent: :destroy

  accepts_nested_attributes_for :payments, allow_destroy: true
end
