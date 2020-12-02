require_relative 'pet'
require_relative 'niffler'
require_relative 'hippogriff'
require 'time'
require 'yaml'
require 'erb'

class Pet_Menu


  attr_accessor :name, :status


  def self.call(env)
    new(env).response.finish
  end

  def initialize (env)
    @rack_request = Rack::Request.new(env)
    @asleep = false
    @stuffInBelly = 10
    @stuffInIntestine = 0
    @mood = 'норм'
    @lives = 5
    @energy = 10
    @birthTime = Time.new
    @status = "уровень голода - #{@stuffInBelly} === уровень энергии - #{@energy} 
      === настроение животины - #{@mood} === количество жизней - #{@lives}"
    commands = %w[feed sleeping play wakeup study bath calm WC help age exit]
    if @animal_type == 'niffler'
      commands += 'giveBack'
    elsif @animal_type == 'hippogriff'
      commands += 'fly'
    end
  end

  def create_pet(name, animal_type)
    @name = name
    @animal_type = animal_type
    #p "Выберите животное, которое бы хотели: Niffler или Hippogriff."
    #@animal_type = gets.chomp.downcase
    #p "Как бы Вы хотели его назвать?"
    #name = gets.chomp
    if @animal_type == 'niffler'
    	@pet = Niffler.new(name)
    elsif @animal_type == 'hippogriff'
      @pet = Hippogriff.new(name)
    #else
    	#p "В настоящий момент другие виды недоступны."
    end
      #p "Подождите немного пока животина родится."
      #sleep 5
      #p "Нюхлер #{name} родился. Теперь это Ваша ответственность."
      #sleep 2
  end

  def redirect(uri)
    [302, { "Location" => uri }, []]
  end

  def response
    case @rack_request.path
    when '/'
      Rack::Response.new(render("../views/form.html.erb"))

    when '/create_pet'
      Rack::Response.new do |response|
        response.set_cookie('hungry', @@stuffInBelly)
        response.set_cookie('WC', @stuffInIntestine)
        response.set_cookie('mood', @mood)
        response.set_cookie('lives', @lives)
        response.set_cookie('energy', @energy)
        response.set_cookie('name', @name)
        response.redirect('/index')
      end

    when '/exit'
      Rack::Response.new('Good bye!', 302)
      Rack::Response.new(render("../views/exit.html.erb"))
=begin
    when '/meditation'
      return Logic.meditation_params(@req, 'drink') if @req.params['drink']
      if get("drink") >= 100
        Rack::Response.new('Game complete', 404)
        Rack::Response.new(render("complete.html.erb"))
      else
        Rack::Response.new(render("meditation.html.erb"))
      end
=end
    when '/index'
      if death
        Rack::Response.new('Game Over', 404)
        Rack::Response.new(render("../views/exit.html.erb"))
      else
        start_to_play
        Rack::Response.new(render("../views/index.html.erb"))
      end

=begin      
      return Pet_Actions.feed if @rack_request('feed')
      return Pet_Actions.sleeping if @rack_request('sleeping')
      return Pet_Actions.play if @rack_request('play')
      return Pet_Actions.wakeup if @rack_request('wakeup')
      return Pet_Actions.study if @rack_request('study')
      return Pet_Actions.bath if @rack_request('bath')
      return Pet_Actions.calm if @rack_request('calm')
      return Pet_Actions.WC if @rack_request('WC')
      return Pet_Actions.help if @rack_request('help')

    else
      Rack::Response.new('Not Found', 404)
    end
=end    
  end
end


  def start_to_play

    while true 
    	command = comm
    	case command
  	    when 'feed'
  	    	@pet.feed
  	    when 'sleeping'
  	    	@pet.sleeping
  	    when 'play'
  	    	@pet.play
  	    when 'wakeup'
  	    	@pet.wakeup
  	    when 'study'
  	    	@pet.study
  	    when 'bath'
  	    	@pet.bath
  	    when 'calm'
  	    	@pet.calm
  	    when 'WC'
  	    	@pet.WC
  	    when 'giveBack'
  	    	@pet.askToGiveBack
  	    when 'help'
  	    	@pet.help
  	    when 'age'
  	    	@pet.show_age
        when 'fly'
          @pet.fly
  	    when 'exit'
  	    	break
  	    else
  	    	p "Сорян, я не понимаю что от меня требуется."
  	    end
    end
  end


  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end


end

#Menu.new.start_to_play