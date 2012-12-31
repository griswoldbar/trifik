require 'spec_helper'

describe "Actor" do
    
  it_behaves_like(:thing) do
    let(:thing) {build(:actor)}
  end
  
  it_behaves_like(:actor) do
    let(:actor) {build(:actor)}
  end
  
  
end