require 'wongi-engine'
require_relative 'rulesets/features_ruleset'
require_relative 'loader'

include Wongi::Engine::DSL

# initialize the wongi engine
ENGINE = Wongi::Engine.create

include Loader

def setup_engine
  # build the feature rule set and add it to Engine
  # Note: each rule set file must include function build_rule_set that returns a rule set
  # TODO: replace with more dynamic loading to all files in ruleset dir
  ENGINE << build_features_rule_set

  # TEST
  # ENGINE << ["1", :no_of_sales, 20]
  # Load all agencies no of sales to the engine
  Loader::load_all_agencies_to ENGINE
end