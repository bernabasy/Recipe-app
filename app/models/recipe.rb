class Recipe < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :preparation_time, presence: true

  validates :cooking_time, presence: true

  validates :description, presence: true
  validates :preparation_time, numericality: { only_integer: true, greater_or_equal_to: 0 }
  validates :cooking_time, numericality: { only_integer: true, greater_or_equal_to: 0 }
  validates :description, presence: true
  validates :public, inclusion: { in: [true, false], message: 'should be a boolean value' }
end
