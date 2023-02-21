# frozen_string_literal: true

module Bot
  class Common
    CONFIG = YAML.load_file('../config/config.yml')
    SECONDS_IN_DAY = 86400
  end
end
