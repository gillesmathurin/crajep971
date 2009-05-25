desc "Delete all the fake datas from the database"
task :delete_fake_datas => :environment do
  CategorieAction.delete_all
  Action.delete_all
  Article.delete_all
  Evenement.delete_all
  Lien.delete_all
end