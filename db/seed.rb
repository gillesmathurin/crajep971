# Reset the table
CategorieAction.delete_all
Action.delete_all
User.delete_all
Article.delete_all
Evenement.delete_all
Lien.delete_all

# Création des catégories et des actions
1.upto(4) do
  @categorie = CategorieAction.create(:nom => Faker::Name.name, :theme => Faker::Lorem.paragraphs(2))
  1.upto(3) do
    Action.create(:nom => Faker::Lorem.words(2), :description => Faker::Lorem.paragraphs(3), :categorie_action_id => @categorie.id)
  end
end

# Création du user beta
User.create(:name => "beta", :login => "beta", :email => Faker::Internet.email, :password => "betabeta",
 :password_confirmation => "betabeta", :categorie => "0", :state => 'active')
 
 # Création de 4 articles et de 2 commentaires par articles
1.upto(4) do
 Article.create(:titre => Faker::Lorem.words(2), :body => Faker::Lorem.paragraphs(3), :user_id => User.find_by_login("beta").id)
end 
Article.all.each do |article|
  2.times do
    article.comments.create(:body => Faker::Lorem.paragraphs(2), :user_id => User.find_by_login("beta").id)
  end
end

# Création d'evenements du mois
@next_date = Date.today.beginning_of_month
while @next_date <= Date.today.end_of_month
  Evenement.create(:date => @next_date, :titre => Faker::Lorem.words(2), :description => Faker::Lorem.paragraphs(2))
  @next_date += 5.days
end

# Création de liens
10.times do
  Lien.create(:nom => Faker::Lorem.words(2), :adresse => "http://www." + Faker::Internet.domain_name())
end