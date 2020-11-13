require_relative 'pet'
require_relative 'niffler'
require 'time'

class Menu


  COMMANDS = ['feed', 'sleeping', 'play', 'wakeup', 'study', 'bath', 'calm', 'WC', 'giveBack', 'help', 'age', 'exit']

def create_pet
  puts "Выберите животное, которое бы хотели: Niffler или ничего."
  @animal_type = gets.chomp.downcase
  puts "Как бы Вы хотели его назвать?"
  name = gets.chomp
  if @animal_type == 'niffler'
  	@pet = Niffler.new(name)
  	puts "Подождите немного пока животина родится."
    sleep 5
    puts "Нюхлер #{name} родился. Теперь это Ваша ответственность."
    sleep 2
  else
  	puts "В настоящий момент другие виды недоступны."
  end
  
end

def start_to_play
  create_pet

  while true 
  	command = comm
  	case command
  	  when 'feed'
  	  	@pet.feed
  	  when 'sleeping'
  	  	@pet.sleeping
  	  when 'play'
  	  	@pet.play
  	  when 'wakeup'
  	  	@pet.wakeup
  	  when 'study'
  	  	@pet.study
  	  when 'bath'
  	  	@pet.bath
  	  when 'calm'
  	  	@pet.calm
  	  when 'WC'
  	  	@pet.WC
  	  when 'giveBack'
  	  	@pet.askToGiveBack
  	  when 'help'
  	  	@pet.help
  	  when 'age'
  	  	@pet.show_age
  	  when 'exit'
  	  	break
  	  else
  	  	puts "Сорян, я не понимаю что от меня требуется."
  	  end
  	end
end

def comm
  puts "Выберите комманду: "
  puts COMMANDS
  command = gets.chomp.downcase
end

end

Menu.new.start_to_play