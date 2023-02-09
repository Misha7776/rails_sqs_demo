module AwsSqs
  class CreateQueue < AwsSqs::Base
    def call
      puts "Creating the queue named '#{queue_name}'..."
      if queue_created?
        puts 'Queue created.'
      else
        puts 'Queue not created.'
      end
    end

    private

    attr_accessor :queue_name

    def queue_created?
      sqs_client.create_queue(queue_name: queue_name)
      true
    rescue StandardError => e
      puts "Error creating queue: #{e.message}"
      false
    end
  end
end
