require 'spec_helper'

describe "Player" do
  
  it_behaves_like(:model) do
    let(:model) {build(:room)}
  end
  
  it_behaves_like(:actor) do
    let(:actor) { build(:player) }
  end
  
  it_behaves_like(:mover) do
    let(:mover) { build(:player) }
  end
end