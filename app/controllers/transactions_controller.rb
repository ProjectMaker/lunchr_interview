require 'validate'

class TransactionsController < ApplicationController
  before_action :validate_pagination_params
  before_action :validate_sort_params

  def index
    render json: Transaction
                   .order(created_at: @sort.direction.to_s)
                   .page(@pagination.number)
                   .per(@pagination.size),
           status: :ok
  end


  def validate_pagination_params
    @pagination = Validate::Pagination.new(params[:page] || {})
    if !@pagination.valid?
      render json: { error: @pagination.serialize_errors } and return
    end
  end

  def validate_sort_params
    @sort = Validate::Sort.new(params[:sort] || {})
    if !@sort.valid?
      render json: { error: @sort.serialize_errors } and return
    end
  end
end
