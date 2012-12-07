require 'spec_helper'

describe "Mover" do
  include_context "connected rooms"
    
  it_behaves_like(:mover) do
    let(:mover) {
      actor = build(:actor)
      actor.add_modifier(:mover)
      actor
    }
  end
  

end