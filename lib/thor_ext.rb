# frozen_string_literal: true

require 'thor'

module ThorExt
  VERSION = '0.1.0'

  module Start
    def self.extended(base)
      super
      base.check_unknown_options!
    end

    def start(given_args = ARGV, config = {})
      config[:shell] ||= ::Thor::Base.shell.new
      handle_help_switches(given_args) do |args|
        dispatch(nil, args, nil, config)
      end
    rescue StandardError => e
      handle_exception_on_start(e, config)
    end

    private

    def handle_help_switches(given_args)
      yield(given_args.dup)
    rescue ::Thor::UnknownArgumentError => e
      retry_with_args = []

      if given_args.first == 'help'
        retry_with_args = ['help'] if given_args.length > 1
      elsif (e.unknown & %w[-h --help]).any?
        retry_with_args = ['help', (given_args - e.unknown).first]
      end
      raise if retry_with_args.none?

      yield(retry_with_args)
    end

    def handle_exception_on_start(error, config)
      return if error.is_a?(Errno::EPIPE)
      raise if ENV['VERBOSE'] || !config.fetch(:exit_on_failure, true)

      message = error.full_message.to_s
      message.prepend("[#{error.class}] ") if message.empty? || !error.is_a?(::Thor::Error)

      config[:shell]&.say_error(message, :red)
      exit(false)
    end
  end
end
