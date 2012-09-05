require "time"
require "httparty"
require_relative "httparty/business_parser"

module Sustaination

  class Business

    include  ::HTTParty
    parser   Sustaination::HTTParty::BusinessParser
    base_uri 'app.sustaination.co'

    attr_accessor :awards, :blog, :claim, :created_at, :created_by_id,
                  :deleted_at, :delivery, :description, :email, :facebook, :id,
                  :imported, :imported_name, :latitude, :linked_in, :longitude,
                  :name, :opening_times, :owner_id, :phone, :slug, :twitter,
                  :updated_at, :verified, :website, :address

    def initialize(params)
      params.each do |k,v|
        instance_variable_set "@#{k}", v
      end
    end

    def self.find(opts = {})
      get '/businesses', :query => {:business_search => opts}
    end

    def connections
      @connections ||= Connection.find_for_business self
    end

  end

end

