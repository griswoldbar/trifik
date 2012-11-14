FactoryGirl.define do
  factory :trif do
    sequence(:id)   {|n| "trif-#{n}".to_sym}
    sequence(:name) {|n| "Trif #{n}" }
    description "A non-descript room"
    initialize_with { Trif.build(id, {name: name, description: description})}
  end
end