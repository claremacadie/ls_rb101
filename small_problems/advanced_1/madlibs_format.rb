# madlibs_format.rb

# solution using format placeholders %{name}

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS = %w(fox dog head leg).freeze
VERBS = %w(jumps lifts bites licks).freeze
ADVERBS = %w(easily lazily noisily excitedly).freeze

def madlibs(text)
  puts format(text, noun: NOUNS.sample,
                    verb: VERBS.sample,
                    adjective: ADJECTIVES.sample,
                    adverb: ADVERBS.sample)
end

madlibs("The %{adjective} brown %{noun} %{adverb} %{verb} the %{adjective} yellow " \
"%{noun}, who %{adverb} %{verb} his %{noun} and looks around.")