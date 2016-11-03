class Search < ApplicationRecord
  belongs_to :location

  has_many :search_terms
  has_many :terms, through: :search_terms

  has_many :results
  has_many :jobs, through: :results
end
