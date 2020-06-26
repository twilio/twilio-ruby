##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'WorkerChannel' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .workers('WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .worker_channels.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://taskrouter.twilio.com/v1/Workspaces/WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Workers/WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels?PageSize=50&Page=0",
              "key": "channels",
              "next_page_url": null,
              "page": 0,
              "page_size": 1,
              "previous_page_url": null,
              "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels"
          },
          "channels": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "assigned_tasks": 0,
                  "available": true,
                  "available_capacity_percentage": 100,
                  "configured_capacity": 1,
                  "date_created": "2014-05-14T10:50:02Z",
                  "date_updated": "2014-05-15T16:03:42Z",
                  "sid": "WCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "task_channel_sid": "TCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "task_channel_unique_name": "default",
                  "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/WRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "worker_sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .workers('WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .worker_channels.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels?PageSize=50&Page=0",
              "key": "channels",
              "next_page_url": null,
              "page": 0,
              "page_size": 1,
              "previous_page_url": null,
              "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels"
          },
          "channels": []
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .workers('WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .worker_channels.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .workers('WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .worker_channels('WCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://taskrouter.twilio.com/v1/Workspaces/WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Workers/WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels/WCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "assigned_tasks": 0,
          "available": true,
          "available_capacity_percentage": 100,
          "configured_capacity": 1,
          "date_created": "2014-05-14T10:50:02Z",
          "date_updated": "2014-05-15T16:03:42Z",
          "sid": "WCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "task_channel_sid": "TCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "task_channel_unique_name": "default",
          "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/WRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "worker_sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .workers('WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .worker_channels('WCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .workers('WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .worker_channels('WCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://taskrouter.twilio.com/v1/Workspaces/WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Workers/WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels/WCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "assigned_tasks": 0,
          "available": true,
          "available_capacity_percentage": 100,
          "configured_capacity": 3,
          "date_created": "2014-05-14T10:50:02Z",
          "date_updated": "2014-05-15T16:03:42Z",
          "sid": "WCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "task_channel_sid": "TCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "task_channel_unique_name": "default",
          "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/WRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "worker_sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .workers('WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .worker_channels('WCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end
end