require_relative '../lib/docking_station.rb'
require_relative '../lib/bike.rb'

describe DockingStation do

  def fill_station station
    20.times { station.dock(Bike.new) }
  end


                      ## Here 'capacity: 20 is passing a value to
                      ## class DockingStation '(options)' to initialize it
  let(:station) { DockingStation.new capacity: 20 }
  let(:bike) { Bike.new }

  it 'should be empty after we build it' do
    expect(station.bike_count).to eq 0
  end

  it 'should be able to dock a bike' do
  # For pending this test: -> xit 'should be able to dock a bike' do
    station.dock(bike)
    expect(station.bike_count).to eq 1
  end

  it 'should be able to release a bike' do
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count).to eq 0
  end

  it 'should know when it has reached capacity' do
    fill_station(station)
    expect(station.full?).to be true
  end

  it 'should not accept a bike if it\'s full' do
    fill_station(station)
    expect { station.dock(bike) }.to raise_error 'Station is full'
  end

  it 'should provide a list of available bikes' do
    working_bike, broken_bike = Bike.new, Bike.new
    # SAME: 
          #working_bike = Bike.new
          #broken_bike = Bike.new

    broken_bike.break
    station.dock(working_bike)
    station.dock(broken_bike)
    
    puts station.available_bikes.inspect

    expect(station.available_bikes).to eq [working_bike]
  end


end