class Cat
    def initialize()
        @cuteness_level = 0
        @name = ""
        @@color_options = ["black", "grey", "calico", "white", "tuxedo", "orange", "tabby"]
        @color = @@color_options[rand(@@color_options.count)]
        @@bad_habit_options = { 1   =>  "meowing at you constantly",
                                2   =>  "chasing a moth",
                                3   =>  "stalking the other pets with a bloodlust",
                                4   =>  "killing a mouse",
                                5   =>  "scratching your chair",
                                6   =>  "peeing in your bed"
                                }
        @bad_habits_key = rand(5)+1
        @bad_habits = @@bad_habit_options[@bad_habits_key]
    end
     
    def name_cat()
        @name = gets.chomp
        puts "#{@name} is a lovely name!"
    end
    
    def color
        @color
    end
    
    def bad_habits_key
        @bad_habits_key
    end
    
    def bad_habits
        @bad_habits
    end
    
    def name
        @name
    end
    
end

class Sucker
    def initialize()
        @kindness_level = rand(10) + 1
        @sucker_level = 0
        @pet_number = 0
        @owned_cats = []
    end
    
    def kindness_level
        @kindness_level
    end
    
    def sucker_level
        @sucker_level
    end
    
    def pet_number
        @pet_number
    end

    def owned_cats
        @owned_cats
    end
    
    def check_pet_number
        if @pet_number > 4
            puts "Congratulations! You are now a crazy cat person."
        end
    end
    
    def check_kindness
        if @kindness_level < 1
           puts "Congratulations! You are no longer nice enough to deserve a kitty and aren't welcome back at the cat shelter."     
        end
    end
        
    def store_cat(new_cat)
        @owned_cats << new_cat 
        @pet_number += 1
    end
    
    def list_owned_cats
        
        puts "You own the following cats:"
        @owned_cats.each do |currcat|
            puts "#{currcat.name}"
        end
    end
    
    def make_kind(kind_modifier)
        @kindness_level += kind_modifier
    end

    def make_sucker(sucker_modifier)
        @sucker_level += sucker_modifier
    end
    
end

player = Sucker.new()

rejection_counter = 0

puts "Welcome to the Crazy Cat Shelter! Owning multiple pets is a fine balance between insanity and love."

while player.pet_number < 5 && player.kindness_level > 0
    # player options
    puts "What would you like to do?"
    puts "1 - Visit the cat shelter"
    puts "2 - List your owned cats"
    puts "3 - Pet a cat"
   
    choice = gets.chomp
    case choice
    
    #choice 1
    when "1"
        cat_shelter = Cat.new()
        puts "You spot a cute #{cat_shelter.color} kitty. However, it seems to rank a #{cat_shelter.bad_habits_key} out of 6 in mischievousness. Would you like to adopt it? Y or N."
        wants_cat = gets.chomp.upcase
        
            if wants_cat == "Y" && player.sucker_level < 10
            
                #pick a name
                puts "Please pick a name for your cat."
                cat_shelter.name_cat()
              
                #increment player's attributes based on the cat's attributes
                player.make_kind(1)
                player.make_sucker(cat_shelter.bad_habits_key.to_i)
                puts "Your kindess has increased to #{player.kindness_level}. Your sucker level has increased to #{player.sucker_level}."
                
                
                #put the cat in the owned cat array
                player.store_cat(cat_shelter)
                
                
            elsif wants_cat == "Y" && player.sucker_level > 9
                puts "I'm sorry, you have your hands too full of kitties. Maybe pick a cat that's less mischievous?"
                
            else
                puts "No problem. There are lots of cats in the shelter."
                rejection_counter += 1
                if rejection_counter > 2
                    player.make_kind(-1)
                    player.make_sucker(-1)
                    puts "However, your kindess has decreased to #{player.kindness_level}. Your sucker level has decreased to #{player.sucker_level}."
                end
            end
        
    
    #choice 2
    when "2"
        player.list_owned_cats

    
    #choice 3
    when "3"
        if player.pet_number > 0
            naughty_cat = player.owned_cats[rand(player.pet_number) - 1]
            naughty_cat_name = naughty_cat.name
            naughty_cat_behavior = naughty_cat.bad_habits
  
        
            puts "You are such a nice cat lover! But also a sucker for succumbing to #{naughty_cat_name} who is currently #{naughty_cat_behavior}."
            player.make_kind(0.5)
            player.make_sucker(0.5)
            puts "Your kindess has increased to #{player.kindness_level}. Your sucker level has increased to #{player.sucker_level}."
            
        else
            puts "I'm sorry, you can't pet something you don't have."
        end
    end

end

player.check_kindness
player.check_pet_number