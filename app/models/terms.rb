class Term < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :searches
end
