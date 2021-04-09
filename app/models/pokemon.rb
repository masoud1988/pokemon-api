class Pokemon < ApplicationRecord
  belongs_to :user

  # Set validations to secure attributes
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

  # implement the logic of pg_search for name, type_1, and type_2
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name, :type_1, :type_2],
    using: {
      tsearch: { prefix: true } # <-- now `CharizardMega Cha` will return something!
    }

end
