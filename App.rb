require "./Hangman.rb"
require "./Player.rb"
require "yaml"



loop do
  puts "Press 'y' to load saved game, Pres 'n' to play new game, pres 'exit' to exit"
  answer = gets.chomp.downcase
  i = 0
    if answer == "y" && File.exist?("saved.yaml")
	  hangman = Hangman.load_game[0]
	  hangman.rand_word_select
	  word = hangman.choosen_word
	  player = Hangman.load_game[1]
	  i = Hangman.load_game[2]
    elsif answer == "n"
      hangman = Hangman.new
      hangman.rand_word_select
      word = hangman.choosen_word
      player = Player.new(word.length)
      i = 0
    elsif answer == "exit"
 	  exit
    else
 	  puts "You entered wrong options,please try again"
    end
  
 
while i < word.length
  test_data = [hangman,player,i]
  puts "Please input a word or type 'save' if  you want to save your game"
  input = gets.chomp.downcase
  saved_data = [hangman,player,i]
  if input == "save"
    hangman.save_game(saved_data)
    break
  end
  player.display_correct_incorrect(input,word)
  puts "You have #{word.length - i-1} remaining guesses"
  break if hangman.game_win(player.arr_correct)
 i = i+1
end
end #loop do end


