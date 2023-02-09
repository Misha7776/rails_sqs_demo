module AwsSqs
  class Base < BaseService
    private

    attr_accessor :queue_name

    def sqs_client
      @sqs_client ||= Aws::SQS::Client.new
    end

    def sts_client
      @sts_client ||= Aws::STS::Client.new
    end

    def queue_url
      @queue_url ||= 'https://sqs.' + Aws.config[:region] + '.amazonaws.com/' + sts_client.get_caller_identity.account + '/' + queue_name
    end
  end
end
