# Gets the type of pyramid from the user
def ask_pyramid_type
  puts "Bienvenue dans ma super pyramide !"
  puts "Quel type de pyramide veux-tu? full ou wtf?"
  print "> "
  type = gets.chomp

  while type!="full" && type!="wtf" do
    puts "Je n'ai pas compris votre réponse." 
    puts "Ecris \"full\" pour une pyramide entière, ou écris \"wtf\" pour une pyramide en losange"
    print "> "
    type = gets.chomp
  end

  return type
end

# Gets the number of floors for the user, for both types of pyramid
def ask_nb_floors(type)
  case type
  when "full"
    puts "Combien d'étages veux-tu ?"
    nb_floors = gets.chomp.to_i
  when "wtf"
    puts "Combien d'étages veux-tu ? Choisis un nombre impair."
    print "> "
    nb_floors = gets.chomp.to_i

    while nb_floors%2==0 do
      puts "J'ai dit un nombre impair !!"
      puts "Choisis un nombre impair d'étages s'il te plaît"
      print "> "
      nb_floors = gets.chomp.to_i
    end
  else
    "Error: #{type} is an unkown type of pyramid"
  end

  return nb_floors
end

# building full pyramid based on number of floors as input
def full_pyramid(nb_floors)
  nb_floors.times do |i|
    puts " " * (nb_floors-i-1) + "#" * (2*i+1)
  end
end

# building wtf pyramid based on number of floors as input
def wtf_pyramid(nb_floors)
  nb_half = nb_floors/2
  nb_half.times do |i|
    puts " " * (nb_half-i).abs() + "#" * (2*i + 1) #haut de la pyramide
  end
  
  puts "#" * nb_floors  #centre de la pyramide
  
  nb_half.times do |i| #bas de la pyramide
    puts " " * (i+1) + "#" * (2*(nb_half-i)-1)
  end
end

# building different types of pyramids
def build_pyramid(type,nb_floors)
  case type
  when "full"
    full_pyramid(nb_floors)
  when "wtf"
    wtf_pyramid(nb_floors)
  else
    "Error: #{type} is an unkown type of pyramid"
  end
end

def perform
  type = ask_pyramid_type
  nb_floors = ask_nb_floors(type)
  build_pyramid(type,nb_floors)
end

perform



