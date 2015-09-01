require_relative '../lib/bike.rb'

#We're describing functionality of the specific class, Bike
describe Bike do
  
  # Instantiating an instance of the Bike class and refactored to be 'bike'
  let(:bike) { Bike.new }

  it 'should not be broken after with create it' do
    expect(bike.broken?).to be false
    # Same: expect(bike.broken?).not_to be broken
  end

  it 'should be able to break' do
    bike.break

    expect(bike.broken?).to be true
  end

  it 'should be able to be fixed' do
    bike.break
    bike.fix

    expect(bike.broken?).to be false
  end


end