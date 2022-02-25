require 'docking_station.rb'

describe DockingStation do
    let(:bike) { double :bike }

    it "should respond to release_bike" do
        expect(subject).to respond_to(:release_bike)
    end

    it 'should release a working bike' do
        a_bike = double("a_bike", :working? => true, :broken? => false)
        subject.dock(a_bike)
        expect(subject.release_bike.working?).to eq true
    end

    it 'should dock a bike' do
        expect(subject.dock(bike)).to eq [bike]
    end

    it 'should raise an error when releasing a bike from an empty dock' do
        station = DockingStation.new
        expect { station.release_bike }.to raise_error('Dock empty error')
    end

    it 'should raise an error when trying to dock a bike where the docking station is full' do
        station = DockingStation.new
        station.capacity.times { station.dock(bike) }
        expect { station.dock(bike) }.to raise_error('Dock full error')
    end

    it 'should allow the system maintainer to set the capacity of docking stations' do
        expect(DockingStation).to respond_to(:new).with(1).argument
    end

    it 'should have a default capacity' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'should have a variable capacity' do
        station = DockingStation.new(50)
        50.times { station.dock(bike) }
        expect{ station.dock(bike) }.to raise_error 'Dock full error'
    end

    it 'should not release broken bikes' do
        station = DockingStation.new
        a_bike = double("a_bike", :report_broken => true, :broken? => true)
        a_bike.report_broken
        station.dock(a_bike)
        expect(station.release_bike).to eq nil
    end

end