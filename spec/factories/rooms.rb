FactoryGirl.define do
  factory :room do
    sequence(:id)   {|n| "room-#{n}".to_sym}
    sequence(:name) {|n| "Room #{n}" }
    description "A non-descript room"
    zone {FactoryGirl.build(:zone)}
    initialize_with { Room.build(id, {name: name, description: description, zone_id: zone.id}) }
  end
end