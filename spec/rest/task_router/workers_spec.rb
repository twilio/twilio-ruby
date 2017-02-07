require 'spec_helper'

page_1 = '{"workers":[{"sid":"worker1Sid","friendly_name":"w1","account_sid":"someAccountSid","activity_sid":"WA73403a6d8d9f71d8de350bbf31a9baac","activity_name":"Offline","workspace_sid":"someWorkspaceSid","attributes":"{}","available":false,"date_created":"2017-02-07T10:20:46Z","date_updated":"2017-02-07T10:20:46Z","date_status_changed":"2017-02-07T10:20:46Z","url":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid/Workers/WK8c3581a41442b7c12cdc3ae2d5cb6c7a","links":{"channels":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid/Workers/WK8c3581a41442b7c12cdc3ae2d5cb6c7a/Channels","activity":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid/Activities/WA73403a6d8d9f71d8de350bbf31a9baac","workspace":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid"}}],"meta":{"page":0,"page_size":1,"first_page_url":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid/Workers?PageSize=1&Page=0","previous_page_url":null,"url":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid/Workers?PageSize=1&Page=0","next_page_url":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid/Workers?PageSize=1&Page=1&PageToken=PAWK8c3581a41442b7c12cdc3ae2d5cb6c7a","key":"workers"}}'
page_2 = '{"workers":[{"sid":"worker2Sid","friendly_name":"w2","account_sid":"someAccountSid","activity_sid":"WA73403a6d8d9f71d8de350bbf31a9baac","activity_name":"Offline","workspace_sid":"someWorkspaceSid","attributes":"{}","available":false,"date_created":"2017-02-07T10:23:01Z","date_updated":"2017-02-07T10:23:01Z","date_status_changed":"2017-02-07T10:23:01Z","url":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid/Workers/WKa028d90b4aa608fbd119f82b5fadccc8","links":{"channels":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid/Workers/WKa028d90b4aa608fbd119f82b5fadccc8/Channels","activity":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid/Activities/WA73403a6d8d9f71d8de350bbf31a9baac","workspace":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid"}}],"meta":{"page":1,"page_size":1,"first_page_url":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid/Workers?PageSize=1&Page=0","previous_page_url":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid/Workers?PageSize=1&Page=0&PageToken=PBWKa028d90b4aa608fbd119f82b5fadccc8","url":"https://taskrouter.twilio.com/v1/Workspaces/someWorkspaceSid/Workers?PageSize=1&Page=1&PageToken=PAWK8c3581a41442b7c12cdc3ae2d5cb6c7a","next_page_url":null,"key":"workers"}}'

describe Twilio::REST::TaskRouter::Workers do
  it 'should paginate correctly' do
    FakeWeb.register_uri(:get, %r/taskrouter\.twilio\.com/, [
      { body: page_1 },
      { body: page_2 }
    ])
    tr_client = Twilio::REST::TaskRouterClient.new("someAccountSid", "someAuthToken", "someWorkspaceSid")
    workers_1 = tr_client.workers.list(:page_size => 1)
    workers_2 = workers_1.next_page
    expect(workers_2.first.instance_variable_get("@path")).to eq('/v1/Workspaces/someWorkspaceSid/Workers/worker2Sid')
  end
end



