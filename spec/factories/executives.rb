FactoryGirl.define do
  factory :executive do
    player { FactoryGirl.build(:player) }
    initialize_with { Executive.new(player) }
  end
end