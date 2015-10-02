require 'yaml'

class CliTalkyTalk

  attr_accessor :options, :preferences

  def initialize(options=nil)
    @options = options || OpenStruct.new
    begin
      personal_pref_path = Dir.home + '/.cli-talky-talk.yml'
      default_path = File.expand_path('../../', __FILE__) + '/config/preferences.yml'
      [personal_pref_path, default_path].each do |path|
        if File.exist? path
          @preferences = YAML.load_file(path)
          log "using preferences from: #{path}"
          break
        end
      end
      raise "unable to load preferences" unless @preferences 
    rescue Psych::SyntaxError => e
      raise "There was an error parsing the config file: #{e}"
    end
  end

  def rand(arr)
    arr.sample
  end

  def speak
    sentence = options.sentence || random_sentence
    log "sentence: #{sentence}"
    `say -v#{voice} #{sentence}`
  end

  def random_sentence
    "#{get :greetings}, #{get :names}!   #{get :statuses}"
  end

  def log(str)
    if options and options.debug
      puts str
    end
  end

  def get(key)
    str = rand preferences['segments'][key.to_s]
    # convert for specific keyword tokens
    case str
    when 'WHOAMI'
      `whoami`.chomp
    else
      str
    end
  end

  def voice
    voice_opts = preferences['options']['voice']
    whitelist = voice_opts['whitelist']
    blacklist = voice_opts['blacklist']

    voice = if options.voice
      options.voice
    elsif whitelist.kind_of?(Array)
      rand whitelist
    else
      avail_voices = voices - blacklist if blacklist.kind_of?(Array)
      rand avail_voices
    end
    log "voice: #{voice}"
    voice
  end

  def voices
    `say -v \?`.split("\n").select { |v| v =~ /en_/ }.map { |v| v.gsub(/\s+en_[A-Z]{2}.*$/,"")}
  end

  def self.voices
    self.new.voices
  end
end
