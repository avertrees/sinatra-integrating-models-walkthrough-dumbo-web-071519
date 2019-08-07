require_relative 'config/environment'
require_relative "./models/text_analyzer.rb"

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do  

    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @most_used_character = @analyzed_text.most_used_letter.keys[0]
    @numer_of_times = @analyzed_text.most_used_letter[@most_used_character]
    erb :results

  end
end
