require 'docking_station.rb'

describe DockingStation do
    it "should respond to release_bike" do
        expect(subject).to respond_to(:release_bike)
    end

    it 'should release a working bike' do
        bike = Bike.new
        subject.dock(bike)
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

    it 'should raise an error when trying to dock a bike where the docking station is full' do
        dock = DockingStation.new
        dock.dock(Bike.new)
        expect { dock.dock(Bike.new) }.to raise_error('Dock full error')
    end

end