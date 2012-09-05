module Sustaination

  class Address

    attr_accessor :business_id, :city, :country_id, :county, :created_at, :id, :line_1, :line_2, :postcode, :updated_at

    def initialize(params)
      params.each do |k,v|
        instance_variable_set "@#{k}", v
      end
    end

  end

end
