require 'time'
require 'yaml'

class Pet

  attr_accessor :name, :status


  def initialize (name, animal_type)
    @name = name
    @animal_type = animal_type
    @asleep = false
    @stuffInBelly = 10
    @stuffInIntestine = 0
    @mood = 'норм'
    @lives = 5
    @energy = 10
    @birthTime = Time.new
    @status = "уровень голода - #{@stuffInBelly} === уровень энергии - #{@energy} 
      === настроение животины - #{@mood} === количество жизней - #{@lives}"
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
    save
  end

  def sleeping
    puts "Вы укладываете животину спать."
    @asleep = true
    @energy += 3
    passedTime
    save
  end

  def play
    puts "Вы играете с #{@name}."
    @energy -= 2
    @mood = 'счастлив'
    if @energy <= 6
      puts "Жизнь меня к такому не готовила, хозяин."
    end
    save
  end

  def wakeup
    @asleep = false
    @mood = 'зачем и почему'
    randomState
    save
  end

  def study
    puts "Вы учите #{@name} какой-то дичи."
    @energy -= 2
    @mood = 'ну такое'
    save
  end

  def bath
    puts "#{@name} купется."
    @mood = 'зачем и почему'
    @energy -= 1
    save
  end

  def calm
    if angry
      puts "Вы гладите #{@name} и поите его чайком."
      sleep 5
      puts "Ну ладно, этот чай был весьма неплох."
    end
    save
  end

  def WC
    if @stuffInIntestine >= 6
      puts "Наконец-то."
      @stuffInIntestine = 0
    else
      puts "Не хочу, не буду."
    end
    save
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
    save
  end

  def save
    name = self.name
    pet = YAML.dump(self) 
    File.open("./db/#{name}.yml", 'w') { |f| f.puts(pet) }
  end

  def show_users_pet
    puts "Выберите имя пользователя и введите его ниже: "
    show_all_users
    chosen_name = gets.chomp.downcase
    if @user.first_name == chosen_name
      has_pet?
      YAML.load(File.read("./db/#{first_name}.yml"))
    else
      puts "Такого пользователя не существует или его имя было введено некорректно."
    end
  end

  def change_animal_type
    puts "Ведите новый тип животного: Niffler или Hippogriff."
    new_animal_type = gets.chomp.downcase
    self.animal_type = new_animal_type
    save
  end

  def change_animal_name
    puts "Введите новое имя:"
    new_name = gets.chomp.downcase
    self.name = new_name
    save
  end

  def change_users_login
    puts "Введите новый пароль:"
    new_login = gets.chomp.downcase
    self.first_name = new_login
    save
  end

  def change_status
    @stuffInBelly = gets.chomp.to_i
    @energy = gets.chomp.to_i
    @mood = gets.chomp.to_i
    @lives = gets.chomp.to_i
    save
  end

  def annihilation
    puts "За что?"
    @lifes = 0
    save
  end

  def reset
    initialize
    save
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