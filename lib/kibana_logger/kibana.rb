module Kibana
  class << self

    KIBANA_LOG_PATH = 'log/kibana.log'.freeze
    KIBANA_CRONOLOG_LOG_PATH = 'log/kibana.%Y%m%d.log'.freeze

    def logger
      @logger ||= cronolog_path.present? ? io_logger : file_logger
    end

    private

    def file_logger
      @file_logger ||= LogStashLogger.new(
        type: :file,
        path: kibana_log_path || KIBANA_LOG_PATH
      )
    end

    def io_logger
      @io_logger ||= LogStashLogger.new(
        type: :io,
        io: IO.popen("#{cronolog_path} #{(kibana_cronolog_log_path || KIBANA_CRONOLOG_LOG_PATH)}", 'w')
      )
    end

    def cronolog_path
      @cronolog_path ||= Rails.configuration.x.cronolog_path
    end

    def kibana_cronolog_log_path
      @kibana_cronolog_log_path ||= Rails.configuration.x.kibana.cronolog_log_path
    end

    def kibana_log_path
      @kibana_log_path ||= Rails.configuration.x.kibana.log_path
    end
  end
end
