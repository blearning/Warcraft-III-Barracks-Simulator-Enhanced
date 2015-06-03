require_relative 'spec_helper'

describe Peasant do

  let(:seige) {SiegeEngine.new}
  let(:seige2) {SiegeEngine.new}
  let(:footman) {Footman.new}

    describe "#attack!" do
    it "cant attack any instance that belongs to a unit" do
      expect(seige.attack!(footman)).to be_falsy
    end
    it "cant attack any instance that belongs to a unit, but can attack other SiegeEngines" do
      expect(seige.attack!(seige2)).to be_falsy
    end
    it "attacks double if the target they are attacking is a barrack" do
      seige.attack!(seige2)
      expect(seige2.health_points).to eq(300)
    end

  end

end

