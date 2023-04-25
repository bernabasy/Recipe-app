class Food < ApplicationRecord
  belongs_to :user

  def self.get_all_foods
    self.all
  end
end
