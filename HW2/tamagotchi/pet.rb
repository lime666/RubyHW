require 'time'

class Pet

  attr_accessor :name


def initialize name
    @name = name
    @asleep = false
    @stuffInBelly = 10
    @stuffInIntestine = 0
    @mood = 'норм'
    @lives = 5
    @enegry = 10
    @birthTime = Time.new

end

def feed
  if @stuffInBelly <= 5
    puts "Спасибо, было очень вкусно, хотя я хз чем ты меня накормил."
    @mood = 'доволен'
    @energy += 2
    @stuffInBelly += 3
    @stuffInIntestine += 2
  else 
    puts "Спасибо, я не голоден."
  end
end

def sleeping
  puts "Вы укладываете животину спать."
  @asleep = true
  @energy += 3
  passedTime
end

def play
  puts "Вы играете с #{@animal_type}."
  @energy = @energy - 2
  @mood = 'счастлив'
  if @energy <= 6
    puts "Жизнь меня к такому не готовила, хозяин."
  end
end

def wakeup
  @asleep = false
  @mood = 'зачем и почему'
  randomState
end

def study
  puts "Вы учите #{@name} какой-то дичи."
  @enegry -= 2
  @mood = 'ну такое'
end

def bath
  puts "#{@name} купется."
  @mood = 'зачем и почему'
  @energy -= 1
end

def calm
  if angry
    puts "Вы гладите #{@name} и поите его чайком."
    sleep 5
    puts "Ну ладно, этот чай был весьма неплох."
  end
end

def WC
  if @stuffInIntestine >= 6
    puts "Наконец-то."
    @stuffInIntestine = 0
  else
    puts "Не хочу, не буду."
  end
end

def help
  puts "feed - накормить"
  puts "sleep - положить спать"
  puts "play - поиграть"
  puts "wakeup - разбудить"
  puts "study - учить"
  puts "bath - купаться"
  puts "calm - успокоить"
  puts "WC - опорожнить кишечник"
  puts "giveBack - попросить отдать вещь"
  puts "help - помощь"
end

def show_age
  pet_age
end


private

def hungry?
  @stuffInBelly <= 3
  puts "Корми меня полностью."
end

def passedTime
  if @stuffInBelly > 0
    @stuffInBelly -= 1
    @stuffInIntestine +=1
  elsif @asleep
    @asleep = false
    @stuffInBelly -= 1
  end
end

def boring?
  @mood == 'ну такое'
  puts "С меня хватит. Я хочу поиграть."
end

def wantToSleep
  if (@asleep == false) & (@energy <= 2)
    puts "Кровать. Мне нужна кровать."
  end
end

def death
  if (@stuffInBelly == 0) || (@energy == 0)
  	@lives -= 1
  elsif (@stuffInBelly == 2)  || (@energy == 2)
  	puts "Хозяин, я скоро помру, сделай что-нибудь, пожалуйста."
  elsif @stuffInBelly > 10 
    puts "#{@name} разорвало на части, везде кровь и спецэффекты."
  end
end

def angry
  if (@mood == 'зачем и почему') || (@energy > 10)
    puts "В мире не хватит ромашкового чая, чтобы успокоить ярость в моей груди."
  end
end

def pet_age
  age = Time.now - @birthTime
end

def randomState
  rand_act = [method(:wantToSleep), method(:boring?), method(:hungry?)]
  rand_act.sample.map {|r| r.call}
end


end