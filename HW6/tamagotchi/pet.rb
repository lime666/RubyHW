require 'time'
require 'yaml'
require 'erb'

class Pet_Actions

  
  def feed
    if @stuffInBelly <= 5
      p "Спасибо, было очень вкусно, хотя я хз чем ты меня накормил."
      @mood = 'доволен'
      @energy += 2
      @stuffInBelly += 3
      @stuffInIntestine += 2
    else 
      p "Спасибо, я не голоден."
    end
  end

  def sleeping
    p "Вы укладываете животину спать."
    @asleep = true
    @energy += 3
    passedTime
  end

  def play
    p "Вы играете с #{@name}."
    @energy -= 2
    @mood = 'счастлив'
    if @energy <= 6
      p "Жизнь меня к такому не готовила, хозяин."
    end
  end

  def wakeup
    @asleep = false
    @mood = 'зачем и почему'
    randomState
  end

  def study
    p "Вы учите #{@name} какой-то дичи."
    @energy -= 2
    @mood = 'ну такое'
  end

  def bath
    p "#{@name} купется."
    @mood = 'зачем и почему'
    @energy -= 1
  end

  def calm
    if angry
      p "Вы гладите #{@name} и поите его чайком."
      sleep 5
      p "Ну ладно, этот чай был весьма неплох."
    end
  end

  def WC
    if @stuffInIntestine >= 6
      p "Наконец-то."
      @stuffInIntestine = 0
    else
      p "Не хочу, не буду."
    end
  end

  def help
    p "feed - накормить"
    p "sleep - положить спать"
    p "play - поиграть"
    p "wakeup - разбудить"
    p "study - учить"
    p "bath - купаться"
    p "calm - успокоить"
    p "WC - опорожнить кишечник"
    p "giveBack - попросить отдать вещь"
    p "help - помощь"
  end

  def show_age
    pet_age
  end

  def death
    if (@stuffInBelly == 0) || (@energy == 0)
      @lives -= 1
    elsif (@stuffInBelly == 2)  || (@energy == 2)
      p "Хозяин, я скоро помру, сделай что-нибудь, пожалуйста."
    elsif @stuffInBelly > 10 
      p "#{@name} разорвало на части, везде кровь и спецэффекты."
    end
  end


  private

  def hungry?
    @stuffInBelly <= 3
    p "Корми меня полностью."
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
    p "С меня хватит. Я хочу поиграть."
  end

  def wantToSleep
    if (@asleep == false) & (@energy <= 2)
      p "Кровать. Мне нужна кровать."
    end
  end

  def angry
    if (@mood == 'зачем и почему') || (@energy > 10)
      p "В мире не хватит ромашкового чая, чтобы успокоить ярость в моей груди."
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