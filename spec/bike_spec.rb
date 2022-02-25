require 'bike'

describe Bike do
  it "should respond to working?" do
    expect(subject).to respond_to(:working?)
  end

  it 'should respond to report_broken' do
    expect(subject).to respond_to(:report_broken)
  end
end