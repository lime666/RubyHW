require 'time'
require_relative 'pet' 

class Niffler_Actions < Pet_Actions


  def initialize name
    super
  end

  def askToGiveBack
    if stillStuff
  	  p "Верни все назад."
  	  @mood = 'ну такое'
  	  @energy -= 1
      sleep 3
  	  p "Ну ладно, так уж и быть."
    end
    randomState
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

  def stealStuff
    if @energy == 9 
      p "Ваш нюхлер украл заначку из кармана зимней куртки."
    end
  end

  end