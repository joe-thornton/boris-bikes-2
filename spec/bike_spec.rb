require 'bike'

describe Bike do
  bike = Bike.new
  it "should respond to working?" do
    expect(bike).to respond_to(:working?)
  end
end