require "cli/talky/talk/version"

module Cli
  module Talky
    module Talk
      @voices = `say -v \?`.split("\n").select { |v| v =~ /en_US/ }.map { |v| v.gsub(/\s+en_US.*$/,"")}

      @greetings = [
        'ahoy', 
        'greeting',
        'saalutations',
        'waazame',
        'bleep booop',
        'exceslior',
        'land hoe',
        'hail',
      ]

      @names = [
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

      @statuses = [
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
        `say -v#{rand(@voices)} #{random_sentence}`
      end

      def random_sentence
        "#{rand @greetings}, #{rand @names}!   #{rand @statuses}"
      end
    end
  end
end
