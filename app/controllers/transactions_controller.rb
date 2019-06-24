require 'errors'

class TransactionsController < ApplicationController
  rescue_from Errors::UnpermittedParameterValue, with: :invalid_parameters

  def index
    validate_list_params
    render json: Transaction.all.order(created_at: list_params[:sort_direction].to_s),
           status: :ok
  end

  private
  def validate_list_params
    sort_direction = list_params[:sort_direction]
    has_correct_direction = ['asc', 'desc'].include? sort_direction.downcase
    raise Errors::UnpermittedParameterValue.new(parameter: :sort_direction, value: sort_direction) unless has_correct_direction
  end

  def invalid_parameters(exception)
    render json: { errors: { exception.parameter => exception.message } },
           status: 422
  end

  def list_params
    params.permit(:sort_direction)
  end
end
