require 'docking_station.rb'

describe DockingStation do
    it "should respond to release_bike" do
        expect(subject).to respond_to(:release_bike)
    end

    it 'should release a working bike' do
        bike = subject.release_bike
        expect(bike).to be_instance_of(Bike)
        expect(bike.working?).to(eq(true))
    end

end