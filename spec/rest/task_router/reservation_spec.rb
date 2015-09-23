require 'spec_helper'

describe Twilio::REST::TaskRouter::Reservations do
  it 'creates a reservation object' do
    task = Twilio::REST::TaskRouter::Task.new('someUri', 'someClient')
    expect(task).to respond_to(:reservations)
    expect(task.reservations.instance_variable_get('@path')).to eq('someUri/Reservations')
  end
  it 'gets a reservation object' do
    worker = Twilio::REST::TaskRouter::Worker.new('someUri', 'someClient')
    expect(worker).to respond_to(:reservations)
    expect(worker.reservations.instance_variable_get('@path')).to eq('someUri/Reservations')
  end
end
