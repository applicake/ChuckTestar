require 'rspec/core/formatters/base_text_formatter'
require 'notifications/growl'

class ChuckTestrFormatter < RSpec::Core::Formatters::BaseTextFormatter
  def icon(name)
    File.join(File.dirname(__FILE__), '../assets', name)
  end

  def notify!(title, icon_filename)
    GrowlNotify.normal(:title => 'RSpec', :description => title, :icon => icon(icon_filename))
    `say 'Your tests pass!'`
  end

  def delay(seconds)
    sleep(seconds)
  end

  def start(example_count)
    super(example_count)
    output.print green('Y')
  end

  def stop
    output.print green('p')
    output.print green("\n\nYour tests pass!\n")
    notify!('Your tests pass', 'chuck-normal.png')
    delay(2)
    if @failed_examples.length > 0
      output.print magenta("\n\nNope! It's just Chuck Testa!")
      notify!('Nope! It\'s just Chuck Testa!', 'chuck-nope.png')
      `say "Nope! It's just Chuck Testa!"`
      delay(1)
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

