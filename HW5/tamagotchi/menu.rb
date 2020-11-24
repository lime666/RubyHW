require_relative 'pet'
require_relative 'niffler'
require 'time'
require 'yaml'
require_relative '../user_folder/session'
require_relative '../user_folder/registration'

class Menu


  COMMANDS = %w[feed sleeping play wakeup study bath calm WC giveBack help age exit]

def create_user
  puts "Введите Ваше имя: "
  first_name = gets.chomp.downcase
  puts "Введите пароль: "
  password = gets.chomp.downcase
  if password.length <= 8
    puts "Длина пароля должна быть не менее 8 символов."
    puts "Введите другой пароль: "
    password = gets.chomp.downcase
  end
  @user = Session.new(first_name, password).sign_in  
  create_user unless @user
  create_pet
end

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

def has_pet?
  File.exists?("./db/#{@user.first_name}.yml")
end

def load_pet
  YAML.load(File.read("./db/#{@user.first_name}.yml"))
end

def user_pet
  has_pet? ? load_pet : create_pet
end

def start_to_play
  create_user

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
      when 'show_users_pet'
        @pet.show_users_pet
      when 'change_animal_type'
        @pet.change_animal_type
      when 'change_animal_name'
        @pet.change_animal_name
      when 'change_users_login'
        @pet.change_users_login
      when 'change_status'
        @pet.change_status
      when 'annihilation'
        @pet.annihilation
      when 'reset'
        @pet.reset
  	  when 'exit'
  	  	break
  	  else
  	  	puts "Сорян, я не понимаю что от меня требуется."
  	  end
  	end
end

def comm
  puts "Выберите комманду: "
  puts @user.commands.join(' ^_^ ')
  command = gets.chomp.downcase
end

end

Menu.new.start_to_play