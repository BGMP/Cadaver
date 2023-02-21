# frozen_string_literal: true

require 'concurrent'
require 'discordrb'
require 'duration'
require 'yaml'

require_relative 'common'

# Main Bot module
#
module Bot

  #
  # Initialize Bot
  #

  @bot = Discordrb::Bot.new(:token => Common::CONFIG[:token], :intents => [:server_messages])

  #
  # Re-Volt...
  #

  @next = Duration.new(:seconds => 5)
  rv_task = Concurrent::TimerTask.new(:execution_interval => @next.seconds) do |task|
    @bot.send_message(Common::CONFIG[:channel], Common::CONFIG[:message])

    @next = Duration.new(:days => rand(2..7))
    task.execution_interval = @next.days * Common::SECONDS_IN_DAY
  end

  rv_task.execute

  at_exit do
    @bot.stop
  end

  @bot.run
end
