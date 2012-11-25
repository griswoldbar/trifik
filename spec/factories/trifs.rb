FactoryGirl.define do
  factory :trif, :class => Class.new do
    sequence(:id)   {|n| "trif-#{n}".to_sym}
    sequence(:name) {|n| "Trif #{n}" }
    description "A non-descript thing"
    klass { FactoryGirl.build(:model_klass) }
    initialize_with { klass.build(id, {name: name, description: description})}
  end
end