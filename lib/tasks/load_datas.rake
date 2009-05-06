require 'faker'

desc "Creation de 4 categories d'actions avec 3 actions associées"
task :load_datas => :environment do
  CategorieAction.delete_all
  Action.delete_all
  
  1.upto(4) do
    categorie = CategorieAction.create(:nom => Faker::Name.name, :theme => Faker::Lorem.paragraphs(2))
    1.upto(3) do
      Action.create(:nom => Faker::Lorem.words(2), :description => Faker::Lorem.paragraphs(3), :categorie_action_id => categorie.id)
    end
  end
  
end

desc "Creation de"