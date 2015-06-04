require_relative 'spec_helper'

describe Unit do

  let(:unit) {Unit.new}
  let(:barrack) {Barracks.new}

  describe "#dead?" do
    it "returns true if HP hits 0 or lower" do
      unit.should_receive(:health_points).and_return(0)
      expect(unit.dead?).to be_truthy
    end
  end

  describe "#attack!" do
    it "cannot attack another unit if the unit is dead" do
      unit.should_receive(:health_points).and_return(0)
      expect(unit.attack!(barrack)).to be_falsy
    end

    it "alive units cannot attack dead units" do
      barrack.should_receive(:health_points).and_return(0)
      expect(unit.attack!(barrack)).to be_falsy
    end

  end
  
end

