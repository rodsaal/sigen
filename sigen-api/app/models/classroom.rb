class Classroom < ApplicationRecord
  validates :grade, presence: true
  validates :shift, presence: true
  validates :year, presence: true

  enum shift: { morning: 0, afternoom: 1 }
end
