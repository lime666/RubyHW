class Niffler < Pet


def initialize name
  @name = name
end

def askToGiveBack
  if stillStuff
  	puts "Верни все назад."
  	@mood = 'ну такое'
  	@enegry -= 1
  	puts "Ну ладно, так уж и быть."
  end
  randomState
end


private

def stealStuff
  if @energy == 9 
    puts "Ваш нюхлер украл заначку из кармана зимней куртки."
  end
end

end