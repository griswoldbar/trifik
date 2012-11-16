require 'spec_helper'

describe "Connection" do
  let(:connection) { build(:connection) }
  

  describe "associations" do
    describe ":room" do
      let(:room) { build(:room) }
      it "has one" do
        connection.room = room
        connection.room.should resemble room
      end
    end
  end
end