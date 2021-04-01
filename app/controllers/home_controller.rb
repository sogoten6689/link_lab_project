class HomeController < ApplicationController
  def index
    puts 111111111
    puts ENV["HELLO"]
    puts 222222222
  end
end
