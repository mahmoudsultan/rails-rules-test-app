module Loader
 # Loads all agencies from database to the rules engine
  def load_all_agencies_to(engine)
    Agency.all.each do |agency|
      engine << [agency.id, :no_of_sales, agency.no_of_sales]
      engine << [agency.id, :agency_type, agency.agency_type]
    end
  end
end