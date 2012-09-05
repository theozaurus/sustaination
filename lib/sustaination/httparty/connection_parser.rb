require "json"

module Sustaination
  module HTTParty
    class ConnectionParser < ::HTTParty::Parser

      SupportedFormats = {"application/json" => :json}

      def parse
        json = JSON.parse body
        connections = json["connections"] || []
        puts connections.first.keys.map{|k| ":#{k}"}.join(", ")
        connections.map{|c| Sustaination::Connection.new munge(c) }
      end

    private

      def munge(hash)
        Hash[hash.map{|k,v|
          v = case k
          when /_business$/
            Sustaination::Business.new v if v
          else
            v
          end
          [k,v]
        }]
      end

    end
  end
end
