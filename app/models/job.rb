class Job <ApplicationRecord
  validates :jobkey, presnece: true, uniqueness: true
  validates :company, presnece: true
end
