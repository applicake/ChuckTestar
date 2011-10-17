require 'rspec/core/formatters/base_text_formatter'
class ChuckTestrFormatter < RSpec::Core::Formatters::BaseTextFormatter
  def start(example_count)
    super(example_count)
    output.print green('Y')
  end
  
  def stop
    output.print green('p')
    output.print green("\n\nYour tests pass!\n")
    `say 'Your tests pass!'`
    sleep(2)
    if @failed_examples.length > 0
      output.print magenta("\n\nNope! It's just Chuck Testa!")
      `say "Nope! It's just Chuck Testa!"`
      sleep(1)
    end
  end
  
  def example_passed(example)
    super(example)
    output.print green('e')
  end

  def example_pending(example)
    super(example)
    output.print green('e')
  end

  def example_failed(example)
    super(example)
    output.print green('e')
  end

  def start_dump
    super()
    output.puts
  end
end

