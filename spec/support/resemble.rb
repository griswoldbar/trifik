RSpec::Matchers.define :resemble do |expected|
  match do |actual|
    
    #ensures proxies match and object IDs don't matter
    if expected.is_a? Array
      expected.map {|item| item.record } == actual.map {|item| item.record }
    else
      actual.record == expected.record
    end
  end
end