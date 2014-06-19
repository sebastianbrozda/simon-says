module SimonSays
  class Output
    def messages
      @messages ||= []
    end

    def puts(message)
      messages << message
    end

    def output
      @output ||= Output.new
    end
  end
end