require 'wongi-engine'

include Wongi::Engine

require 'json'

module RuleSetBuilder
  def add_feature_to_agency(agency_id, feature_number)
    # add feature to the agency by the id given

    agency_features = $redis.get(agency_id)
    if agency_features.nil?
      $redis.set(agency_id, [feature_number].to_json)
    else
      agency_features = JSON.parse agency_features
      unless agency_features.include? feature_number.to_s
        agency_features << feature_number
      end
      $redis.set(agency_id, agency_features.to_json)
    end
  end

  # def build_features_rule_set
  def build_rule_set
    ruleset 'features_rule_set' do
      rule 'If Sales count > 100 add feature 1' do
        forall {
          has :ID, :no_of_sales, :COUNT
          greater :COUNT, 100
        }
        make {
          # cache the feature to the redis server here
          action { |token|
            add_feature_to_agency token[:ID], 1
          }
        }
      end

      rule 'if type is 4 or 5 then add feature 2' do
        forall {
          has :ID, :agency_type, :TYPE
          any {
            option {
              same :TYPE, 4
            }
            option {
              same :TYPE, 5
            }
          }
        }
        make {
          action { |token|
            add_feature_to_agency token[:ID], 2
          }
        }
      end
    end
  end
end