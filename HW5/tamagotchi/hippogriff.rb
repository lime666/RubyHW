require 'time'
require_relative 'pet' 

class Hippogriff < Pet


  def initialize name
    super
  end

  def fly
    bow_down
    puts "Гиппогриф Вас катает. Как чудесно видеть мир с высоты."
    @energy -= 4
    wantToSleep
    save
  end

  def feed
    super
  end

  def sleeping
    super
  end

  def play
    super
  end

  def wakeup
    super
  end

  def study
    super
  end

  def bath
    super
  end

  def calm
    super
  end

  def WC
    super
  end

  def age
    super
  end

  def help
    super
  end


  private

  def bow_down
    puts "Для того, чтобы гиппогриф Вас прокатил необходимо показать, что Вам иожно доверять."
    puts "Поклонитесь ему и, не моргая, посмотрите в его глаза."
    puts "Подтвердите действие. Напишите: bow down."
    z = gets.chomp.downcase
    if z != "bow down"
      puts "Гиппогриф отказывается Вас катать."
      return comm
    end

  end


end