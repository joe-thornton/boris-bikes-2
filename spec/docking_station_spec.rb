require 'docking_station.rb'

describe DockingStation do
    it "should respond to release_bike" do
        expect(subject).to respond_to(:release_bike)
    end

    it 'should release a working bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(bike).to be_instance_of(Bike)
        expect(bike.working?).to(eq(true))
        expect(subject.release_bike).to eq bike
    end

    it 'should dock a bike' do
        bike = Bike.new
        expect(subject.dock(bike)).to eq bike
    end

    it 'should raise an error when releasing a bike from an empty dock' do
        dock = DockingStation.new
        expect { dock.release_bike }.to raise_error('Dock empty error')
    end

end