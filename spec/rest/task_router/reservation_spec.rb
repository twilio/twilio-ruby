require 'spec_helper'

describe Twilio::REST::TaskRouter::Reservations do
  it 'creates a reservation object' do
    task = Twilio::REST::TaskRouter::Task.new('someUri', 'someClient')
    expect(task).to respond_to(:reservations)
    expect(task.reservations.instance_variable_get('@path')).to eq('someUri/Reservations')
  end
end
