class Job < ApplicationRecord
  belongs_to :location
  has_many :results
  has_many :searches, through: :results

  validates_presence_of :jobkey
end
