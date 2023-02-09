# frozen_string_literal: true

class BaseService
  class NonKeywordArgumentsError < StandardError; end

  def self.call(*args, &block)
    new(*args, &block).call
  end

  attr_reader :args, :data

  def initialize(args = {})
    raise NonKeywordArgumentsError if args.present? && !args.is_a?(Hash)

    @args = @data = args
    @args.each do |name, value|
      instance_variable_set("@#{name}", value)
    end
  end

  def call; end
end
