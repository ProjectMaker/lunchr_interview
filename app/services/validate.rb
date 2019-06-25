module Validate
  class Base
    include ActiveModel::Validations

    def serialize_errors
      new_errors = {}

      @errors.details.each do |field, field_errors|
        new_errors[field] = field_errors.map do |error|
          {
            code: error[:error],
            message: errors.generate_message(field, error[:error])
          }
        end
      end

      new_errors
    end
  end

  class Pagination < Base
    attr_accessor :number, :size

    validates :number, numericality: true, allow_blank: true
    validates :size, numericality: true, allow_blank: true

    def initialize(params={})
      @number  = params[:number] || 1
      @size = params[:size] || 25
    end
  end

  class Sort < Base

    attr_accessor :direction

    validates :direction, inclusion: { in: %w(asc desc ASC DESC) }, allow_blank: true

    def initialize(params={})
      @direction  = params[:direction] || 'asc'
    end
  end
end
