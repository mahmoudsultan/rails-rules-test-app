module AgencyHelper
  # caching agencies in redis
  def fetch_agencies
    agencies = $redis.get('agencies')
    if agencies.nil?
      agencies = Agency.all.to_json
      $redis.set('agencies', agencies)
      $redis.expire('agencies', 5.hour.to_i)
    end
    return agencies
  end
end