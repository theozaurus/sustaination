require_relative "httparty/connection_parser"

module Sustaination

  class Connection

    include  ::HTTParty
    parser   Sustaination::HTTParty::ConnectionParser
    base_uri 'app.sustaination.co'

    attr_accessor :id, :distance, :from_business, :to_business

    def initialize(params)
      params.each do |k,v|
        instance_variable_set "@#{k}", v
      end
    end

    def self.find_for_business(business)
      get "/businesses/#{business.slug}.json"
    end

  end

end


