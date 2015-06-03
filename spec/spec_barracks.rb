require_relative 'spec_helper'

describe Barracks do

  let(:barracks) {Barracks.new}
  let(:unit) {Unit.new}
  let(:footman) {Footman.new}

  describe "#lumber" do
    it "should start with a resource of 500 lumber." do
      expect(barracks.lumber).to eq(500)
    end
  end

  describe "#health_points" do
    it "has health that is 500 more HP than a unit" do
      expect(barracks.health_points == unit.health_points.to_i + 500).to be_truthy
    end
  end

  describe "#can_be_attacked?" do

    it "check to see if Barracks still have enough health to be attacked" do
      expect(barracks.can_be_attacked?).to be_truthy
    end
  end  

  describe "damage" do

    it "make sure attackers only do half the damage to barracks" do
      footman.attack!(barracks)
      expect(barracks.health_points == 555)
    end

    it "makes sure health points are calculated correctly after damaged" do
      footman.should_receive(:attack_power).and_return(100)
      footman.attack!(barracks)
      expect(barracks.health_points).to eq(510)
    end

  end

end

