module CliTalkyTalk
  def self.included(base)
    binding.pry
    base.extend(ClassMethods)
  end

  module ClassMethods
    VOICES = `say -v \?`.split("\n").select { |v| v =~ /en_US/ }.map { |v| v.gsub(/\s+en_US.*$/,"")}

    GREETINGS = [
      'ahoy', 
      'greeting',
      'saalutations',
      'waazame',
      'bleep booop',
      'exceslior',
      'land hoe',
      'hail',
    ]

    NAMES = [
      `whoami`.chomp,
      'Govna',
      'captain',
      'boss',
      'cheef',
      'over loard',
      'dragon commander',
      'your excellence',
      'exhaulted one',
    ]

    STATUSES = [
      'all done here',
      'works done',
      'bingo!',
      'hazaa',
      'flip Yeah',
      'get back to work',
      'all systems go',
    ]

    def rand(arr)
      arr.sample
    end

    def speak
      `say -v#{rand(VOICES)} #{random_sentence}`
    end

    def random_sentence
      "#{rand GREETINGS}, #{rand NAMES}!   #{rand STATUSES}"
    end
  end
end
