require_relative 'spec_helper'

describe Barracks do

  let(:barracks) {Barracks.new}
  let(:unit) {Unit.new}
  let(:footman) {Footman.new}
  let(:siege) {SiegeEngine.new}

  describe "#can_train_footman?" do
    it "should be able to train a footman with resources" do
      barracks.should_receive(:gold).and_return(900000)
      expect(barracks.can_train_footman?).to be_truthy
    end

    it "should not be able to create a footman without right amount of resources" do
      barracks.should_receive(:food).and_return(0)
      expect(barracks.can_train_footman?).to be_falsy
    end
  end

  describe "#train_footman" do
    it "creates a new instance of Footman" do
      expect(barracks.train_footman).to be_an_instance_of (Footman)
    end
  end

  describe "#can_train_peasant?" do
    it "should be able to train a peasant with resources" do
      barracks.should_receive(:gold).and_return(90) && barracks.should_receive(:food).and_return(5)
      expect(barracks.can_train_peasant?).to be_truthy
    end
    it "should not be able to create a peasant without right amount of resources" do
      barracks.should_receive(:food).and_return(0)
      expect(barracks.can_train_peasant?).to be_falsy
    end
  end

  describe "#train_peasant" do
    it "creates a new instance of Peasant" do
      expect(barracks.train_peasant).to be_an_instance_of (Peasant)
    end
  end

  describe "#can_train_siege?" do
    it "should be able to train a siege with resources" do
      barracks.should_receive(:gold).and_return(200) && barracks.should_receive(:food).and_return(3)
      expect(barracks.can_train_seige?).to be_truthy
    end
    it "should not be able to create a seige without right amount of resources" do
      barracks.should_receive(:food).and_return(0)
      expect(barracks.can_train_seige?).to be_falsy
    end
  end

  describe "#train_siege" do
    it "creates a new instance of siege" do
      expect(barracks.train_seige).to be_an_instance_of (SiegeEngine)
    end
  end

  describe "#lumber" do
    it "should start with a resource of 500 lumber." do
      expect(barracks.lumber).to eq(500)
    end

    it "is false when lumber is sufficient" do
      expect(barracks.lumber).to eq(500)
    end
  end

  describe "#health_points" do
    it "Barracks have 500 health" do
      expect(barracks.health_points).to eq(500)
    end
  end

  describe "#can_be_attacked?" do

    it "check to see if Barracks still have enough health to be attacked" do
      expect(barracks.can_be_attacked?).to be_truthy
    end
  end

  describe "#damage" do

    it "make sure attackers only do half the damage to barracks" do
      footman.attack!(barracks)
      expect(barracks.health_points == 555)
    end

    it "makes sure health points are calculated correctly after damaged" do
      footman.should_receive(:attack_power).and_return(100)
      footman.attack!(barracks)
      expect(barracks.health_points).to eq(450)
    end

  end

end

