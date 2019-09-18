FactoryBot.define do

  def make_sequence name
    sequence name do |n|
      "#{name}_#{n}"
    end
  end

  make_sequence :arena_name
  make_sequence :attacker_name
  make_sequence :defender_name
  make_sequence :equipment_name
  make_sequence :player_name
end
