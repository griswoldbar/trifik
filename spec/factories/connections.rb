FactoryGirl.define do
  factory :connection do
    sequence(:id)   {|n| "connection-#{n}".to_sym}
    initialize_with { Connection.build(id)}
  end
end