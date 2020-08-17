require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.sample( 10 )
    @score = session[:score]
  end

  def score
    @score = 0
    @letters = ('a'..'z').to_a.sample( 10 )
    word = params[:score]
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    attempt_serialized = open(url).read
    attempt_list = JSON.parse(attempt_serialized)
    @answers = ["Sorry but #{word} can't be built out of #{@letters}", "Sorry but #{word} does not seem to be a valid english word...", "Congratulations, #{word} seems to be a valid English word!"]
    new_letters = word.split('')
    new_letters.each do |letter|
      @letters.include?(letter)
      if false
        @answer = @answers[0]
      elsif attempt_list["found"]
        @answer = @answers[2]
        @score += 1
      else
        @answer = @answers[1]
      end
    end
    session[:score] = @score
  end
end
