class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :recipes, dependent: :destroy

  validates :name, presence: true, length: { minimum: 0, maximum: 50 }

  def list_recipes
    Recipe.where(user_id: id)
  end
end
