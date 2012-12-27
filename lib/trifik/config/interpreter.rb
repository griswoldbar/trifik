Interpreter.define do
  given /(#{Trifik::DIRECTIONS.map{|d| "^#{d}$" }.join("|")})/ do |verb|
    self.send(verb)
  end
  
  given /^look$/ do
    look
  end
end