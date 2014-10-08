require 'spec_helper'

describe Twilio::REST::Wds::Reservations do
  it 'creates a reservation object' do
    task = Twilio::REST::Wds::Task.new('someUri', 'someClient')
    expect(task).to respond_to(:reservations)
    expect(task.reservations.instance_variable_get('@path')).to eq('someUri/Reservations')
  end
end
