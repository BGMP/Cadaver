# frozen_string_literal: true

require 'concurrent'
require 'discordrb'
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

  @next = 7 # days
  rv_task = Concurrent::TimerTask.new(:execution_interval => (@next * Common::SECONDS_IN_DAY)) do |task|
    @bot.send_message(Common::CONFIG[:channel], Common::CONFIG[:message])

    @next = rand(7..14)
    task.execution_interval = @next * Common::SECONDS_IN_DAY
  end

  rv_task.execute

  at_exit do
    @bot.stop
  end

  @bot.run
end
