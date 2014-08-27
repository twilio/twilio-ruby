require 'spec_helper'

describe Twilio::REST::Call do

  before do
    @call = Twilio::REST::Call.new('someUri', 'someClient')
  end

  it 'sets up a recordings resources object' do
    expect(@call).to respond_to(:recordings)
    expect(@call.recordings.instance_variable_get('@path')).to eq(
      'someUri/Recordings'
    )
  end

  it 'sets up a notifications resources object' do
    expect(@call).to respond_to(:notifications)
    expect(@call.notifications.instance_variable_get('@path')).to eq(
      'someUri/Notifications'
    )
  end
end
