class Combat < ApplicationRecord

   has_many :turns

   def custom_errors
      @__custom_errors__ ||= []
   end
   
   # Virtual atts
   attr_accessor :player1_id, :player2_id, :weapon1_id, :weapon2_id


end
