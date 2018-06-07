require "./Player.rb"
require 'yaml'

class Hangman
  	attr_accessor :choosen_word, :player
 def initialize
   @choosen_word = rand_word_select
   @player = Player.new(choosen_word.length)
 end

 def play
   while count_words_remaining > 0
  	 puts "Please input a word or type 'save' if  you want to save your game"
  	 input = gets.chomp.downcase
  	 if input == "save"
        save_game
        break
     end
     player.display_correct_incorrect(input,choosen_word)
   	 puts "You have #{player.count_words_remaining} remaining guesses"
  	 break if game_win
   end  
 end

  def count_words_remaining
    player.arr_correct.count {|item| item == "_"} - player.arr_incorect.length
  end

  def rand_word_select
	str = []
	word =""
	f = File.open("5desk.txt","r")
	str = f.readlines
	f.close
	until (word.size >=5 && word.size <= 12) do
   	word = str[rand(0..str.length)].strip.downcase
    end
   word
  end

  def game_win
  	if choosen_word == player.arr_correct.join
  	  puts "You Win"
  	  return true
  	else 
  	  false
  	end
  end

  def save_game
   yaml = YAML::dump(self)
   game_file = File.new("saved.yaml","w")
   game_file.write(yaml)
   game_file.close
 end

 def load_game
 	game_file = File.open("saved.yaml","r")
 	yaml = game_file.read
 	puts yaml
 	game_file.close
 	game_loaded = YAML::load(yaml)
 	game_loaded
 end

def ask_for_a_game
  puts "Enter 'y' for new game,enter 'n' to load a game, or exit to exit the game"
  input = gets.chomp

  until input =="y" || input == "n" || input == "exit"
  	puts "Incorrect, try again"
  	input = gets.chomp.downcase
  end

  if input =='y'
  	Hangman.new.play
  elsif  input =='n'
  	load_game.play
  elsif input == "exit"
  	exit
  else
  	puts "Wrong word entered"
  end


end

end

o = Hangman.new
o.ask_for_a_game