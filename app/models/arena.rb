class Arena < ApplicationRecord

  validates :name, uniqueness: true
end
