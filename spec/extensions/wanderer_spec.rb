require 'spec_helper'

describe Wanderer do
  include_context "connected rooms"
  
  let(:wanderer) { build(:actor).tap {|a| a.add_modifier(:wanderer)} }
  
  
  
end
