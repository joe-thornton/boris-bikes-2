require 'docking_station.rb'

describe DockingStation do
    docking_station = DockingStation.new
    it "should respond to release_bike" do
        expect(docking_station).to respond_to(:release_bike)
    end
end