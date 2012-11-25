FactoryGirl.define do
  factory :connection do
    sequence(:id)   {|n| "connection-#{n}".to_sym}
    description "A non-descript exit"
    direction :north
    initialize_with { Connection.build(id, {description: description, direction: direction})}
  end
end