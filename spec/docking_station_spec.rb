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
        expect(subject.dock(bike)).to eq [bike]
    end

    it 'should raise an error when releasing a bike from an empty dock' do
        dock = DockingStation.new
        expect { dock.release_bike }.to raise_error('Dock empty error')
    end

    it 'should raise an error when trying to dock a bike where the docking station is full' do
        dock = DockingStation.new
        dock.capacity.times { dock.dock(Bike.new) }
        expect { dock.dock(Bike.new) }.to raise_error('Dock full error')
    end

    it 'should allow the system maintainer to set the capacity of docking stations' do
        expect(DockingStation).to respond_to(:new).with(1).argument
    end

    it 'should have a default capacity' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'should have a variable capacity' do
        dock = DockingStation.new(50)
        50.times { dock.dock(Bike.new) }
        expect{ dock.dock(Bike.new) }.to raise_error 'Dock full error'
    end
end