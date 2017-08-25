require 'spec_helper'

describe Twilio::Request do
  before do
    @request = Twilio::Request.new('host',
                                   'port',
                                   'POST',
                                   'url',
                                   { 'param-key' => 'param-value', 'param-keytwo' => 'param-valuetwo' },
                                   { 'data-key' => 'data-value', 'data-keytwo' => 'data-valuetwo' },
                                   { 'header-key' => 'header-value', 'header-keytwo' => 'header-valuetwo' },
                                   ['a', 'b'],
                                   'timeout')
  end

  it 'should initialize readers correctly' do
    expect(@request.host).to eq('host')
    expect(@request.port).to eq('port')
    expect(@request.method).to eq('POST')
    expect(@request.url).to eq('url')
    expect(@request.params).to eq('param-key' => 'param-value', 'param-keytwo' => 'param-valuetwo')
    expect(@request.data).to eq('data-key' => 'data-value', 'data-keytwo' => 'data-valuetwo')
    expect(@request.headers).to eq('header-key' => 'header-value', 'header-keytwo' => 'header-valuetwo')
    expect(@request.auth).to eq(['a', 'b'])
    expect(@request.timeout).to eq('timeout')
  end

  it 'should be represented correctly' do
    expected_string = %((a,b) POST url?param-key=param-value&param-keytwo=param-valuetwo) +
                      %(\n-d "data-key"="data-value") +
                      %(\n-d "data-keytwo"="data-valuetwo") +
                      %(\n-H "header-key": "header-value") +
                      %(\n-H "header-keytwo": "header-valuetwo")
    expect(@request.to_s).to eq(expected_string)
  end
end
