require_relative 'registration.rb'
require 'yaml'


class Session

  def initialize(first_name, password)
    @first_name = first_name
    @password = password
  end

  def sign_up
    if !exists?(users_array)
      users_array << user
      File.open('./db/usersdb.yml', 'w') { |f| f.puts(users_array.to_yaml) }
    end  
  end

  def sign_in
    if is_admin?
      user = Admin.new 
    elsif  is_superadmin?
      user = Superadmin.new
    else
      user = User.new(@first_name, @password)
      if user.exists?(user.load_users)
        if user.correct(user.load_users)
          puts "Ура. Ваше животное соскучилось по Вам."
        else 
          puts "Пароль введен некорректно, попробуйте еще раз."
          return nil
        end
      else
        user.save
      end
    end
    user
  end

  private 

  def is_admin?
    @first_name == 'admin' && @password == 'qwertyuio'
  end

  def is_superadmin?
    @first_name == 'superadmin' && @password == 'asdfghjkl'
  end
end