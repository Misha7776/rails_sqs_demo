module AwsSqs
  class SendMessage < AwsSqs::Base
    def call
      puts "Sending a message to the queue named '#{queue_name}'..."

      if message_sent?
        puts 'Message sent.'
      else
        puts 'Message not sent.'
      end
    end

    private

    attr_accessor :message_body, :queue_name

    def message_sent?
      sqs_client.send_message(queue_url: queue_url,
                              message_body: message_body)
      true
    rescue StandardError => e
      puts "Error sending message: #{e.message}"
      false
    end
  end
end
