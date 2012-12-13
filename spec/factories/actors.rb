FactoryGirl.define do
  factory :actor do
    sequence(:id)   {|n| "actor-#{n}".to_sym}
    sequence(:name) {|n| "Actor #{n}" }
    description "A non-descript person"
    room {FactoryGirl.build :room}
    initialize_with { Actor.build(id, {name: name, description: description, room_id: room.id })}
  end
  
  factory :player, parent: :actor, :class => Player do
    sequence(:id)   {|n| "player-#{n}".to_sym}
    sequence(:name) {|n| "Player #{n}" }
    description "A non-descript person"
    initialize_with { Player.build(id, {name: name, description: description})}
  end
end