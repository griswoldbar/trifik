FactoryGirl.define do
  factory :room do
    sequence(:id)   {|n| "room-#{n}".to_sym}
    sequence(:name) {|n| "Room #{n}" }
    description "A non-descript room"
    initialize_with { Room.build(id, {name: name, description: description})}
  end
end