##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'TaskQueueCumulativeStatistics' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .task_queues('WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                           .cumulative_statistics().fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://taskrouter.twilio.com/v1/Workspaces/WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/TaskQueues/WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/CumulativeStatistics',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "reservations_created": 100,
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "reservations_rejected": 100,
          "tasks_completed": 100,
          "end_time": "2015-07-30T20:00:00Z",
          "tasks_entered": 100,
          "tasks_canceled": 100,
          "reservations_accepted": 100,
          "task_queue_sid": "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "reservations_timed_out": 100,
          "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CumulativeStatistics",
          "wait_duration_until_canceled": {
              "avg": 0,
              "min": 0,
              "max": 0,
              "total": 0
          },
          "wait_duration_until_accepted": {
              "avg": 0,
              "min": 0,
              "max": 0,
              "total": 0
          },
          "wait_duration_in_queue_until_accepted": {
              "avg": 0,
              "min": 0,
              "max": 0,
              "total": 0
          },
          "split_by_wait_time": {
              "5": {
                  "above": {
                      "tasks_canceled": 0,
                      "reservations_accepted": 0
                  },
                  "below": {
                      "tasks_canceled": 0,
                      "reservations_accepted": 0
                  }
              },
              "10": {
                  "above": {
                      "tasks_canceled": 0,
                      "reservations_accepted": 0
                  },
                  "below": {
                      "tasks_canceled": 0,
                      "reservations_accepted": 0
                  }
              }
          },
          "start_time": "2015-07-30T20:00:00Z",
          "tasks_moved": 100,
          "reservations_canceled": 100,
          "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "tasks_deleted": 100,
          "reservations_rescinded": 100,
          "avg_task_acceptance_time": 100
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .task_queues('WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                  .cumulative_statistics().fetch()

    expect(actual).to_not eq(nil)
  end
end