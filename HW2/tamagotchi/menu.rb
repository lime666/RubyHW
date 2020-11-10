require 'pet'
require 'niffler'
require 'time'

class Menu


  COMMANDS = ['feed', 'sleep', 'play', 'wakeup', 'study', 'bath', 'calm', 'WC', 'giveBack', 'help', 'age']

def create_pet
  puts "Выберите животное, которое бы хотели: Niffler или ничего."
  animal_type = gets.chomp.downcase
  if type == 'niffler'
  	@pet = Niffler.new(name)
  else
  	puts "В настоящий момент другие виды недоступны."
  end
  puts "Подождите немного пока животина родится."
end

def start_to_play
  create_pet

  puts "Выберите комманду: "
  puts COMMANDS
  command = gets.chomp.downcase

  until command == 'exit' do 
  	case command
  	  when 'feed'
  	  	@pet.feed
  	  when 'sleep'
  	  	@pet.sleep
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

end