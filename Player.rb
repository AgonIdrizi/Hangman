class Player
  attr_accessor :arr_correct, :arr_incorect
  def initialize(wlength)
  	@arr_correct=["_"]*wlength
  	@arr_incorect=[]
  end


  def display_correct_incorrect(input,word)
  	if word.include?("#{input}")
  		 word.split("").each_with_index do |item,i|
  		   arr_correct[i] = input if input == item
  	   end
  		
  	else
  		arr_incorect << input
  	end
 puts "Correct words typed: #{arr_correct.join}"
 puts "Incorrect words typed: #{arr_incorect.join}"
  end


end