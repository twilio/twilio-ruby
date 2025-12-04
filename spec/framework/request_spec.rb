require 'spec_helper'

describe Twilio::Request do
  it 'should initialize readers correctly' do
    request = Twilio::Request.new('host',
                                  'port',
                                  'POST',
                                  'url',
                                  { 'param-key' => 'param-value', 'param-keytwo' => 'param-valuetwo' },
                                  { 'data-key' => 'data-value', 'data-keytwo' => 'data-valuetwo' },
                                  { 'header-key' => 'header-value', 'header-keytwo' => 'header-valuetwo' },
                                  ['a', 'b'],
                                  'timeout')
    expect(request.host).to eq('host')
    expect(request.port).to eq('port')
    expect(request.method).to eq('POST')
    expect(request.url).to eq('url')
    expect(request.params).to eq('param-key' => 'param-value', 'param-keytwo' => 'param-valuetwo')
    expect(request.data).to eq('data-key' => 'data-value', 'data-keytwo' => 'data-valuetwo')
    expect(request.headers).to eq('header-key' => 'header-value', 'header-keytwo' => 'header-valuetwo')
    expect(request.auth).to eq(['a', 'b'])
    expect(request.timeout).to eq('timeout')
  end

  it 'should be represented correctly' do
    request = Twilio::Request.new('host',
                                  'port',
                                  'POST',
                                  'url',
                                  { 'param-key' => 'param-value', 'param-keytwo' => 'param-valuetwo' },
                                  { 'data-key' => 'data-value', 'data-keytwo' => 'data-valuetwo' },
                                  { 'header-key' => 'header-value', 'header-keytwo' => 'header-valuetwo' },
                                  ['a', 'b'],
                                  'timeout')
    expected_string = %((a,b) POST url?param-key=param-value&param-keytwo=param-valuetwo) +
                      %(\n-d "data-key"="data-value") +
                      %(\n-d "data-keytwo"="data-valuetwo") +
                      %(\n-H "header-key": "header-value") +
                      %(\n-H "header-keytwo": "header-valuetwo")
    expect(request.to_s).to eq(expected_string)
  end

  it 'should be percent encode properly' do
    request = Twilio::Request.new('host',
                                  'port',
                                  'POST',
                                  'url',
                                  { 'param-key' => ':/?#[]@' },
                                  { 'data-key' => 'data-value', 'data-keytwo' => 'data-valuetwo' },
                                  { 'header-key' => 'header-value', 'header-keytwo' => 'header-valuetwo' },
                                  ['a', 'b'],
                                  'timeout')
    expected_string = %((a,b) POST url?param-key=%3A%2F%3F%23%5B%5D%40) +
                      %(\n-d "data-key"="data-value") +
                      %(\n-d "data-keytwo"="data-valuetwo") +
                      %(\n-H "header-key": "header-value") +
                      %(\n-H "header-keytwo": "header-valuetwo")
    expect(request.to_s).to eq(expected_string)
  end

  it 'should be percent encode properly for sub delimiters' do
    request = Twilio::Request.new('host',
                                  'port',
                                  'POST',
                                  'url',
                                  { 'param-key' => '!$&\'()*+,;=' },
                                  { 'data-key' => 'data-value', 'data-keytwo' => 'data-valuetwo' },
                                  { 'header-key' => 'header-value', 'header-keytwo' => 'header-valuetwo' },
                                  ['a', 'b'],
                                  'timeout')
    expected_string = %((a,b) POST url?param-key=%21%24%26%27%28%29%2A%2B%2C%3B%3D) +
                      %(\n-d "data-key"="data-value") +
                      %(\n-d "data-keytwo"="data-valuetwo") +
                      %(\n-H "header-key": "header-value") +
                      %(\n-H "header-keytwo": "header-valuetwo")
    expect(request.to_s).to eq(expected_string)
  end

  it 'should be percent encode percent encode' do
    request = Twilio::Request.new('host',
                                  'port',
                                  'POST',
                                  'url',
                                  { 'param-key' => '%25' },
                                  { 'data-key' => 'data-value', 'data-keytwo' => 'data-valuetwo' },
                                  { 'header-key' => 'header-value', 'header-keytwo' => 'header-valuetwo' },
                                  ['a', 'b'],
                                  'timeout')
    expected_string = %((a,b) POST url?param-key=%2525) +
                      %(\n-d "data-key"="data-value") +
                      %(\n-d "data-keytwo"="data-valuetwo") +
                      %(\n-H "header-key": "header-value") +
                      %(\n-H "header-keytwo": "header-valuetwo")
    expect(request.to_s).to eq(expected_string)
  end

  it 'should be not percent encode these characters' do
    request = Twilio::Request.new('host',
                                  'port',
                                  'POST',
                                  'url',
                                  { 'param-key' => '-._~' },
                                  { 'data-key' => 'data-value', 'data-keytwo' => 'data-valuetwo' },
                                  { 'header-key' => 'header-value', 'header-keytwo' => 'header-valuetwo' },
                                  ['a', 'b'],
                                  'timeout')
    expected_string = %((a,b) POST url?param-key=-._~) +
                      %(\n-d "data-key"="data-value") +
                      %(\n-d "data-keytwo"="data-valuetwo") +
                      %(\n-H "header-key": "header-value") +
                      %(\n-H "header-keytwo": "header-valuetwo")
    expect(request.to_s).to eq(expected_string)
  end

  it 'tests parameter sanitation by encoding to prevent injection and XSS attacks' do
    request = Twilio::Request.new('host',
                                  'port',
                                  'POST',
                                  'url',
                                  { 'param-key' => 'https://malicious.com/?q=<script>alert("xss")</script>' },
                                  { 'data-key' => 'data-value', 'data-keytwo' => 'data-valuetwo' },
                                  { 'header-key' => 'header-value', 'header-keytwo' => 'header-valuetwo' },
                                  ['a', 'b'],
                                  'timeout')
    expected_string = %((a,b) POST url?param-key=https%3A%2F%2Fmalicious.com%2F%3Fq%3D%3Cscript%3Ealert%28%22xss%22%29%3C%2Fscript%3E) +
                      %(\n-d "data-key"="data-value") +
                      %(\n-d "data-keytwo"="data-valuetwo") +
                      %(\n-H "header-key": "header-value") +
                      %(\n-H "header-keytwo": "header-valuetwo")
    expect(request.to_s).to eq(expected_string)
  end
end
