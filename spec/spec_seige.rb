require_relative 'spec_helper'

describe SiegeEngine do

  let(:seige) {SiegeEngine.new}
  let(:seige2) {SiegeEngine.new}
  let(:footman) {Footman.new}
  let(:peasant) {Peasant.new}

  describe "#attack!" do
    it "can't attack peasant" do
      expect(seige.attack!(peasant)).to be_falsy
    end
    it "can't attack footman" do
      expect(seige.attack!(footman)).to be_falsy
    end
    it "can't attack any instance that belongs to a unit" do
      expect(seige.attack!(footman)).to be_falsy
    end
    it "can attack other seige units, but not peasant or footman" do
      expect(seige.attack!(seige2)).to be_falsy
    end
    it "attacks double if the target they are attacking is a barrack" do
      seige.attack!(seige2)
      expect(seige2.health_points).to eq(300)
    end
  end

  describe "#damage" do
    #it "has the health of 395 when attacked by footman" do

    # end
  end

end

