class Pokemon < ApplicationRecord
  belongs_to :user

  validates :number, presence: true
  validates :name, presence: true, uniqueness: true
  validates :type_1, presence: true
  validates :total, presence: true
  validates :speed, presence: true
  validates :generation, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name, :type_1, :type_2],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
