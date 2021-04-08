class Pokemon < ApplicationRecord
  belongs_to :user

  validates :number, presence: true
  validates :name, presence: true, uniqueness: true
  validates :type_1, presence: true
  validates :total, presence: true
  validates :hp, presence: true
  validates :attack, presence: true
  validates :defense, presence: true
  validates :sp_atk, presence: true
  validates :sp_def, presence: true
  validates :speed, presence: true
  validates :generation, presence: true
  validates :legendary, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name, :type_1, :type_2],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
