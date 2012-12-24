FactoryGirl.define do
  factory :interpreter do
    initialize_with {
      Interpreter.new().tap{|i|
        i.define do
          given(/^(.+) (.+) with (.+)$/) {|verb, subject, object| execute(verb, subject, object)}
        end
      }
    }
  end
end