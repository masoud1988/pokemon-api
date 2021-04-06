class Pokemon < ApplicationRecord
  belongs_to :user

  validates :number, presence: true
  validates :name, presence: true, uniqueness: true
  validates :type_1, presence: true
  validates :total, presence: true
  validates :speed, presence: true
  validates :generation, presence: true

end
