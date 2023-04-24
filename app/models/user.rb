class User < ApplicationRecord
  has_many :recipes, dependent: :destroy

  validates :name, presence: true, length: { minimum: 0, maximum: 50 }

  def list_recipes
    Recipe.where(user_id: id)
  end
end
