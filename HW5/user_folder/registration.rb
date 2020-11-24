require 'yaml'

class User

  attr_accessor :first_name, :password

  def initialize(first_name, password)
    @first_name = first_name
    @password = password
  end

  def commands
     %w[feed sleeping play wakeup study bath calm WC giveBack help age exit]
  end

  def show_all_users
    z = Users.all
    puts z
  end

  def exists?(users_array)
    users_array.any? { |h| h[:first_name] == @first_name }
  end

  def correct?(users_array)
    users_array.any? { |h| h[:first_name] == @first_name && h[:password] == @password }    
  end

  def save
    user = {
      first_name: @first_name,
      password: @password,
      role: self.class.to_s
    }
    users_array = load_users

    if exists?(users_array) == false
      users_array << user
      File.open('./db/usersdb.yml', 'w') { |f| f.puts(users_array.to_yaml) }
    end  
  end

  def load_users
    YAML.load(File.read('./db/usersdb.yml')) || []
  rescue
    []
  end
end


class Admin < User


  def initialize
      @first_name = "admin"
  end

  def commands
    super + %w[show_users_pet change_animal_type change_animal_name]
  end

  def help
    super
    puts "show_users_pet - показать питомца другого человека"
    puts "change_animal_type - изменить тип животины"
    puts "change_animal_name - изменить имя животного"
  end

end


class SuperAdmin < Admin


  def initialize
    @first_name = "superadmin"
  end

  def commands
    super + %w[change_users_name change_status annihilation reset]
  end

  def help
    super
    puts "change_users_name - изменить логин пользователя"
    puts "change_status - изменить показатели животного"
    puts "annihilation - аннигилировать питомца"
    puts "reset - сбросить показатели до изначальных"
  end


end