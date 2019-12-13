require 'docking_station'

describe DockingStation do


  it { is_expected.to respond_to(:capacity) }

  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do

    it 'releases working bikes' do
      bike = Bike.new
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raise an error when there are no bikes available' do
      expect{ subject.release_bike }.to raise_error "No bikes available"
    end

    it 'doesnt release a bike' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect(subject.release_bike).to be_nil
    end 
  end

    describe '#dock' do

       it { is_expected.to respond_to(:dock).with(1).argument }

      it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
      end

      it 'returns docked bikes' do
      bike = Bike.new
      #subject.dock(bike)
      expect(subject.dock(bike)).to eq [bike]
      end

      it 'raises an error when the docking station is full' do
        DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
        expect { subject.dock(Bike.new) }.to raise_error "Docking station full"
      end

    end

    describe '#initialize' do
      it ' if the capacity is not specified it gives it a default capacity' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end 

      it 'if a capacity is defined it has that capacity' do
        docking_station = DockingStation.new(30)
        expect(docking_station.capacity).to eq 30
      end 

    end 

end
