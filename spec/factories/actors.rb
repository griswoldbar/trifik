FactoryGirl.define do
  factory :actor do
    sequence(:id)   {|n| "actor-#{n}".to_sym}
    sequence(:name) {|n| "Actor #{n}" }
    description "A non-descript person"
    initialize_with { Actor.build(id, {name: name, description: description})}
  end
end