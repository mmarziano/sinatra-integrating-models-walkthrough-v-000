require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])

    <h2>Most Common Letter: <%=@analyzed_text.most_used_letter.first[0].uppercase%>, used <%=@analyzed_text.most_used_letter.first[1]%> times</h2>
    binding.pry
    erb :results
  end
end
