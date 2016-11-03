class Term < ApplicationRecord
  has_many :searches

  validates_presence_of :keyword
end
