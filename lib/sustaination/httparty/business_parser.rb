require "nokogiri"
require "json"

module Sustaination
  module HTTParty
    class BusinessParser < ::HTTParty::Parser

      SupportedFormats = {"application/html" => :html}

      def parse
        # There's some Javascript with JSON hidden in the HTML, lets find it
        doc = Nokogiri::HTML body
        javascript = doc.css(".container-fluid script").text
        json = javascript.sub(/^\nvar BUSINESSES = /,'').sub(/;.*/m,'')
        bare_business = JSON.parse json
        bare_business.map{|bb| Sustaination::Business.new munger(bb) }
      end

    private

      def munger(hash)
        Hash[hash.map{|k,v|
          v = case k
          when "address"
            Sustaination::Address.new munger(v)
          when /_at$/
            Time.parse v if v
          else
            v
          end
          [k,v]
        }]
      end

    end
  end
end
