module Nrtflrx
  class Request
    BASE_URL = 'http://api-public.netflix.com'

    attr_reader :resource_path, :verb

    def initialize(resource_path, verb)
      @resource_path = resource_path
      @verb          = verb
    end

    def base_url
      BASE_URL
    end
  end
end
