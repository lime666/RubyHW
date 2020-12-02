require 'time'
require_relative 'pet' 

class Hippogriff_Actions < Pet_Actions


  def initialize name
    super
  end

  def fly
    bow_down
    p "Гиппогриф Вас катает. Как чудесно видеть мир с высоты."
    @energy -= 4
    wantToSleep
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
    p "Для того, чтобы гиппогриф Вас прокатил необходимо показать, что Вам иожно доверять."
    p "Поклонитесь ему и, не моргая, посмотрите в его глаза."
    p "Подтвердите действие. Напишите: bow down."
    z = gets.chomp.downcase
    if z != "bow down"
      p "Гиппогриф отказывается Вас катать."
      return comm
    end

  end


end