module AwsSqs
  class QueuePoller < AwsSqs::Base
    def call
      poller.poll(options) do |msg|
        puts msg.body
      end
    end

    private

    attr_accessor :wait_time_seconds,
                  :idle_timeout, :visibility_timeout

    def poller
      @poller ||= Aws::SQS::QueuePoller.new(queue_url)
    end

    def options
      {
        wait_time_seconds: wait_time_seconds || 1,
        idle_timeout: idle_timeout || 60,
        visibility_timeout: visibility_timeout || 1
      }
    end

  end
end
