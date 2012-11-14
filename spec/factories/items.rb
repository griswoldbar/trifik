FactoryGirl.define do
  factory :item do
    sequence(:id)   {|n| "item-#{n}".to_sym}
    sequence(:name) {|n| "Item #{n}" }
    description "A non-descript object"
    initialize_with { Item.build(id, {name: name, description: description})}
  end
end