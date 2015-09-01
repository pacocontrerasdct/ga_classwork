require_relative '../lib/bike.rb'

#We're describing functionality of the specific class, Bike
describe Bike do

  it 'should not be broken after with create it' do
    bike = Bike.new # Instantiate an instance of the Bike class
    expect(bike.broken?).to be false
    # Same: expect(bike.broken?).not_to be broken
  end

  it 'should be able to break' do
    bike = Bike.new
    bike.break
    
    expect(bike.broken?).to be true
  end

  it 'should be able to be fixed' do
    bike = Bike.new
    bike.break
    bike.fix

    expect(bike.broken?).to be false
  end


end