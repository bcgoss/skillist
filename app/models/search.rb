class Search < ApplicationRecord
  belongs_to :term
  belongs_to :location

  has_many :results
  has_many :jobs, through: :results
end
