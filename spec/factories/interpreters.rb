FactoryGirl.define do
  factory :interpreter do
    initialize_with {
      Interpreter.define do
        given(/^(.+) (.+) with (.+)$/) {|verb, subject, object| execute(verb, subject, object)}
      end
      Interpreter.new
    }
  end
end