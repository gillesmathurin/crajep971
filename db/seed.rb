# Reset the table
CategorieAction.delete_all
Action.delete_all
User.delete_all
Article.delete_all
Evenement.delete_all
Lien.delete_all

# Création des catégories et des actions

# Création du user beta
User.create(:name => "beta", :login => "beta", :email => Faker::Internet.email, :password => "betabeta",
 :password_confirmation => "betabeta", :categorie => "0", :state => 'active')
 
 # Création de 4 articles et de 2 commentaires par articles

# Création d'evenements du mois

# Création de liens
