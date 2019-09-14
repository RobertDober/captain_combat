class Arena < ApplicationRecord

  validates :arena_name, uniqueness: true
end
