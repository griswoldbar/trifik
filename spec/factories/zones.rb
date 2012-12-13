FactoryGirl.define do
  factory :zone do
    sequence(:id)   {|n| "zone-#{n}".to_sym}
    sequence(:name) {|n| "Zone #{n}" }
    initialize_with { Zone.build(id, {name: name} )}
  end
end