require 'errors'

class TransactionsController < ApplicationController
  rescue_from Errors::UnpermittedParameterValue, with: :invalid_parameters

  def index
    validate_list_params
    render json: Transaction
                   .order(created_at: list_params[:sort_direction].to_s)
                   .page(params.fetch(:page, 1)),
           status: :ok
  end

  private
  def validate_list_params
    sort_direction = list_params[:sort_direction]
    page = list_params[:page].to_i unless list_params[:page].match(/[^[:digit:]]+/)
    has_correct_direction = ['asc', 'desc'].include? sort_direction.downcase
    raise Errors::UnpermittedParameterValue.new(parameter: :sort_direction, value: sort_direction) unless has_correct_direction
    raise Errors::UnpermittedParameterValue.new(parameter: :page, value: list_params[:page]) unless page.is_a? Integer
  end

  def invalid_parameters(exception)
    render json: { errors: { exception.parameter => exception.message } },
           status: 400
  end

  def list_params
    params.permit(:sort_direction, :page)
  end
end
