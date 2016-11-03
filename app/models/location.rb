class Location < ApplicationRecord
  has_many :searches

  validates_presence_of :country
  validates_presence_of :state
  validates_presence_of :city
  validates_presence_of :postal_code
end
