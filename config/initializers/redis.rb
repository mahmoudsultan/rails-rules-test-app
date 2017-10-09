require 'redis'

$redis = Redis::Namespace.new('features', redis: Redis.new)