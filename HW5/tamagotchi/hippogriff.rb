require 'time'
require_relative 'pet' 

class Hippogriff < Pet


  def initialize name
    super
  end

  def fly
    puts "Гиппогриф Вас катает. Как чудесно видеть мир с высоты."
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


end