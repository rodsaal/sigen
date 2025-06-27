class User < ApplicationRecord
  has_secure_password
  belongs_to :classroom

  validates :name, presence: true
  validates :email, presence: true
  validates :registration_number, presence: true, uniqueness: true
  validates :role, presence: true
  validates :preferred_shift, presence: true

  enum role: { student: 0, teacher: 1 }
end
