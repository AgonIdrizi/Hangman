require "./Hangman.rb"
require "./Player.rb"
require "yaml"

puts "Do you want to play new game, or to load saved one"
answer = gets.chomp.downcase

if answer == "y" && File.exist?("saved.yaml")
	
	hangman = Hangman.load_game[0]
	
	hangman.rand_word_select
	word = hangman.choosen_word
	player = Hangman.load_game[1]
	i = Hangman.load_game[2]
else

  hangman = Hangman.new

  hangman.rand_word_select
  word = hangman.choosen_word

  player = Player.new(word.length)

  i = 0
end
test_data = [hangman,player,i]
while i < word.length

puts "Please input a word or type 'save' if  you want to save your game"
input = gets.chomp.downcase
saved_data = [hangman,player,i]
 if input == "save"
  hangman.save_game(saved_data)
  break
 end


player.display_correct_incorrect(input,word)

break if hangman.game_win(player.arr_correct)

i = i+1
end




