require 'pry'
class CliTalkyTalk

  attr_accessor :options

  def initialize(options)
    @options = options || OpenStruct.new
  end

  VOICES = `say -v \?`.split("\n").select { |v| v =~ /en_/ }.map { |v| v.gsub(/\s+en_US.*$/,"")}

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
    voice = options.voice || rand(VOICES)
    log "voice: #{voice}"
    sentence = options.sentence || random_sentence
    log "sentence: #{sentence}"
    `say -v#{voice} #{sentence}`
  end

  def random_sentence
    "#{rand GREETINGS}, #{rand NAMES}!   #{rand STATUSES}"
  end

  def log(str)
    if options and options.debug
      puts str
    end
  end
end
