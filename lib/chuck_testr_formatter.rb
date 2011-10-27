require 'rspec/core/formatters/base_text_formatter'
require 'notifications/growl'

module Portable
  def self.platform
    if RbConfig::CONFIG['host_os'] =~ /mswin|windows|cygwin/i
      'windows'
    elsif RbConfig::CONFIG['host_os'] =~ /darwin/
      'osx'
    else
      'linux'
    end
  end
end

class ChuckTestrFormatter < RSpec::Core::Formatters::BaseTextFormatter
  def icon(name)
    File.join(File.dirname(__FILE__), '../assets', name)
  end

  def start(example_count)
    super(example_count)
    output.print green('Y')
  end

  def stop
    output.print green('p')
    output.print green("\n\nYour tests pass!\n")
    GrowlNotify.normal(:title => 'RSpec', :description => 'Your tests pass', :icon => icon('chuck-normal.png'))
    say_ok
    sleep(2)
    if @failed_examples.length > 0
      output.print magenta("\n\nNope! It's just Chuck Testa!")
      GrowlNotify.high(:title => 'RSpec', :description => 'Nope! It\'s just Chuck Testa!', :icon => icon('chuck-nope.png'))
      say_nope
      sleep(1)
    end
  end

  def say_ok
    if Portable.platform == 'linux'
      `echo "Your tests pass!" | espeak`
    elsif Portable.platform == 'osx'
      `say 'Your tests pass!'`
    end
  end

  def say_nope
    if Portable.platform == 'linux'
      `echo "Nope! It's just Chuck Testa!" | espeak`
    elsif Portable.platform == 'osx'
      `say "Nope! It's just Chuck Testa!"`
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

