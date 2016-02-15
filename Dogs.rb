
class Dog

  def initialize(name)
    @name = name #ім’я
    @hp = 100 #здоров’є 
    @energy = 100 #енергія
    @time_to_go_to_walk = 0 #час на прогулянку
    @satiety = 100 #ситість
    @mood = 50 #настрій
    @rancor = 0 #злопам’ятність
    @cleanliness = 50 #рівень чистоти
  end

  attr_accessor :energy, :hp, :satiety, :mood, :cleanliness, :name

  def go_to_doctor #До лікаря
    @hp += 50
    hp_values
  end

  def go_to_walk #На прогулянку
    @energy -= 10
    @mood += 10
    @cleanliness -= 20
    @satiety += 10
    @time_to_go_to_walk = 0

    life_cycle
    filter_val
  end

  def bed #Спати
    @mood += 10
    @energy += 20
    @cleanliness -= 20
    @hp += 20

    life_cycle
    filter_val
  end

  def pat #погладити
    @rancor -= 2
    @mood += 10
    @energy += 10
    @cleanliness += 5

    life_cycle
    filter_val
  end

  def give_a_kick #Дати стусана
    @hp -= 10
    @rancor += 1
    @mood -= 20 
    @energy += 10
    @satiety -=7

    life_cycle
    filter_val
    hp_values
  end

  def scold #Лаятись
    @rancor += 1
    @mood -= 10
    @energy += 10

    life_cycle
  end

  def feed #Нагодувати
    @satiety += 40
    @hp += 25
    @energy += 20
    @mood += 10
    @cleanliness -= 10

    life_cycle
    filter_val
  end

  def stirka #Помити
    @cleanliness = 100
    @mood += 25

    life_cycle
    filter_val
  end

  def games #Пограти з собакою
    @energy -= 15
    @cleanliness -=10
    @mood +=10

    life_cycle
    filter_val
  end 

  def filter_val

    changes_features_our_pet

    @energy = 0 if @energy < 0
    @satiety = 0 if @satiety < 0
    @mood = 0 if @mood < 0
    @rancor = 0 if @mood < 0
    @cleanliness = 0 if @cleanliness < 0

    @energy = 100 if @energy > 100
    @satiety = 100 if @satiety > 100
    @mood = 100 if @mood > 100
    @rancor = 10 if @mood > 10
    @cleanliness = 100 if @cleanliness > 100

  end


  def changes_features_our_pet
    hp_values
    @time_to_go_to_walk += 1

    if @time_to_go_to_walk >= 3
      puts 'Please grazed me ...'
      @cleanliness -= 20
    end
  
    if @satiety < 30 || @mood < 50
      @hp -= 10
      @energy -= 30
    end
  
    if @satiety < 40
      puts 'Feed me...'
      @mood -= 10
      @hp -= 10
      @energy -= 20
    elsif @satiety < 20
      @hp -= 20
    end
  end

  def hp_values
    @hp = 100 if @hp > 100
    @hp = 0 if @hp < 0
    if @hp <= 25 and @hp > 0
      puts "I'd like to see a doctor"
    elsif @hp <= 0
      puts "I R.I.P!"
      exit
    else
      puts "I feel good"
    end
  end

  def rancor_detect
    if (0..2).include?(@rancor)
      puts "Everything is fine"
    end
    if (2..4).include?(@rancor)
      puts "Dont touch me"
    elsif @rancor <= 5
      puts "I'll bite you"
    else
      puts "I'm leaving you. Total bad"
      exit
    end
  end

  private

  def life_cycle
    time = rand(101)
    if time < 25
      @energy  -= rand(11)
      @satiety -= rand(21)
      @cleanliness -= rand(5)
    end
    if time < 50
      @energy  -= rand(21) - 5
      @satiety -= rand(36) - 10
      @cleanliness -= rand(10) - 5
    end
    if time < 75
      @energy  -= rand(31) - 10
      @satiety -= rand(51) - 20
      @cleanliness -= rand(20) - 5
    else
      @energy  -= rand(51) - 20
      @satiety -= rand(71) - 30
      @cleanliness -= rand(30) - 10
    end
  end
end

puts "Welcome to the program - tamagochchi care dog"
puts "To get started , press 1 . To exit the program, press 0"

bool = true
while bool
  start_number = gets.to_i
  if start_number == 1

    puts 'What is the name of your pet'
    name = gets.chomp

    dog = Dog.new(name)

     puts "Your actions...\n1. Send to the doctor  #{dog.name};"
     puts "2. Even walk to  #{dog.name};"
     puts "3. put to sleep to #{dog.name};"
     puts "4. Pat to #{dog.name};"
     puts "5. Feed to  #{dog.name};"
     puts "6. Games to  #{dog.name};"
     puts "7. Redeem to  #{dog.name};"
     puts "8. Kick to  #{dog.name};"
     puts "9. Scold  #{dog.name};"
     puts 'print \'help\' if you want to see description all methods'
     puts '0. exit'
     puts
     while bool
      puts "Now, #{dog.name} has (all features have values from 0-100): "
      puts "1. energy = #{dog.energy}\n2. hp = #{dog.hp}\n3. satiety = #{dog.satiety}"
      puts "4. mood = #{dog.mood}\n5. cleanliness = #{dog.cleanliness}"
      puts
      case gets.chomp
        when '1' then dog.go_to_doctor #вилікувати
        when '2' then dog.go_to_walk #вигуляти
        when '3' then dog.bed #покласти спати
        when '4' then dog.pat #погладити
        when '5' then dog.feed #нагодувати
        when '6' then dog.games #пограти
        when '7' then dog.stirka #викупати
        when '8' then dog.give_a_kick #дати стусана
        when '9' then dog.scold #відлаяти
        when '0' then
          puts 'Ok...bye'
          bool = false
        when 'help' then
          puts '1. take a doctor adds 50 hp;'
          puts '2. walk add 10 mood, 10 satiety and rob 10 energy, 20 cleanliness;'
          puts '3. walk add 10 mood, 20 energy, 20 hp and rob 20 cleanliness;'
          puts '4. walk add 10 mood, 10 energy, 5 cleanliness and rob 2 rancor;'
          puts '5. walk add 10 mood, 20 energy, 25 hp, 40 satiety and rob 10 cleanliness;'
          puts '6. walk add 10 mood and rob 10 cleanliness, 15 energy;'
          puts '7. walk add 20 mood and cleanliness = 100;'
          puts '8. walk add 10 energy, +1 rancor and rob 10 hp,20 mood,7 satiety;'
          puts '9. walk add 10 energy, +1 rancor and rob 10 mood;'
          puts 'Don\'t forget about messages. Take care about your pet.'
        else
          puts 'Please, print help, if you don\'t know what to do'
      end
    end

  elsif start_number == 0
    puts 'Goodbye'
    bool = false
  else
    puts 'Please, print 1 or 0'
  end
end
