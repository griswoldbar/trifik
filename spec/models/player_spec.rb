require 'spec_helper'

describe "Player" do
  it_behaves_like(:actor) do
    let(:actor) { build(:player) }
  end
end