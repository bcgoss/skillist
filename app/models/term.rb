class Term < ApplicationRecord
  has_many :search_terms
  has_many :searches, through: :search_terms

  validates_presence_of :keyword
end
