require 'yaml'
class Hangman
  attr_accessor :choosen_word
 def initialize
 	@choosen_word = ""
 end

  def rand_word_select
	str = []
	f = File.open("5desk.txt","r")
	str = f.readlines
	f.close
	until (@choosen_word.size >=5 && @choosen_word.size <= 12) do
   	@choosen_word = str[rand(0..str.length)].strip.downcase
    end
   
end

  def game_win(arr_correct_words)
  	if choosen_word == arr_correct_words.join
  		puts "You Win"
  		return true
  	else 
  		false
  	end
  end

  def save_game(characters)
   yaml = YAML::dump(characters)
   game_file = File.new("saved.yaml","w")
   game_file.write(yaml)
   game_file.close
 end

 def self.load_game
 	game_file = File.open("saved.yaml","r")
 	yaml = game_file.read
 	puts yaml
 	game_file.close
 	YAML::load(yaml)

 end

end