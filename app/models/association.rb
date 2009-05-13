class Association < ActiveResource::Base
  self.site = "http://www.asso-guadeloupe.fr"
  self.user = "gilles"
  self.password = "kagadew"
  self.timeout = 5
  
  def self.find_the_crajep_ones
    ids_liste = [ 3, 1, 6, 9, 5, 11, 106, 13, 77, 82, 18, 8, 7, 12, 19, 644, 14, 10 ]
    associations = []
    ids_liste.each do |id|
      association = Association.find(id)
      associations << association
    end
    return associations
  end
end