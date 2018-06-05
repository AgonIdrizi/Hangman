def rand_word_select
str = []
f = File.open("5desk.txt","r")
str = f.readlines
f.close
  word =""
	
	until (word.size >=5 && word.size <= 12) do
   	word = str[rand(0..str.length)].strip
    end
    word
end

rand_word_select()