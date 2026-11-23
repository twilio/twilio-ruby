# frozen_string_literal: true

require 'spec_helper'

describe Twilio::Values do
  describe '.validate_path_param' do
    ['FW00000000000000000000000000000000', '+15551234567', 'my name.txt', 'a.b', '...', 123].each do |value|
      it "returns #{value.inspect} unchanged" do
        expect(Twilio::Values.validate_path_param(value)).to eq(value)
      end
    end

    [nil, '', '.', '..', 'a/b', 'a?b', 'a#b', '../x', 'FW0/Executions/FN0/Context?x=1'].each do |value|
      it "rejects #{value.inspect}" do
        expect { Twilio::Values.validate_path_param(value) }.to raise_error(ArgumentError, /Invalid path parameter/)
      end
    end
  end
end
