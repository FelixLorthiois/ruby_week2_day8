def dice_roll
  # Les deux lignes suivantes permettent de déclencher le lancer de dés par l'utilisateur
  #puts "Appuie sur \"Enter\" pour lancer les dés"
  #trigger = gets.chomp
  dice = rand(1..6)
  puts "Vous avez fait #{dice} au dé"
  return dice
end

def movement(dice_result)
  case dice_result
  when 1
    move = -1
    puts "Vous reculez d'une case :("
  when 2, 3, 4
    move = 0
    puts "Vous ne bougez pas"
  when 5, 6
    move = 1 
    puts "Vous avancez d'une case :)"
  else
    "Error: #{dice_result} is not an integer between 1 and 6"
  end

  return move

end

def position(old_case,move)
  new_case = old_case + move
  puts "Vous êtes sur la case numéro #{new_case}"
  return new_case
end

def perform
  current_case = 0
  count_dice_rolls = 0
  while current_case < 10 do
    current_case = position(current_case,movement(dice_roll))
    count_dice_rolls += 1
  end
  puts "\n*********************************************************"
  puts "* Bravo! Vous avez gagné en #{count_dice_rolls} tours!! *"
  puts "*********************************************************\n"

  return count_dice_rolls
end

def average_finish_time
  nb_games = 100
  nb_tour_array = []
  nb_games.times do 
    nb_tour_array << perform
  end
  average_dice_rolls = nb_tour_array.inject{ |sum, el| sum + el }.to_f / nb_tour_array.size
  puts "\n\nSur #{nb_games} parties, le nombre de tours moyens pour arriver à la dixième marche est de #{average_dice_rolls}\n\n"
end

#Option 1: faire une partie
#perform

#Option 2: Calculer le nombre de tours moyen sur 100 parties
average_finish_time



