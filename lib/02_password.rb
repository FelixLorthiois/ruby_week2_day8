def signup
  puts "Merci de définir votre mot de passe"
  print "> "
  pwd = gets.chomp
  puts "\n Votre mot de passe est bien enregistré \n"
  return pwd
end 

def login(pwd)
  puts "\n Merci de rentrer votre mot de passe"
  print "> "
  pwd_tentative = gets.chomp

  while pwd_tentative != pwd do
    puts "Mot de passe incorrect" 
    puts "Nouvelle tentative. Merci de rentrer votre mot de passe"
    print "> "
    pwd_tentative = gets.chomp
  end

  welcome_screen

end

def welcome_screen
  puts "\nBienvenue dans votre zone secrète!"
  puts "Voici ton secret : 0+0 = la tete à toto :)"
end

def perform 
  pwd = signup
  login(pwd)
end

perform

