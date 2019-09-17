class Combat < ApplicationRecord

   has_many :turns

   def custom_errors
      @__custom_errors__ ||= []
   end

end
