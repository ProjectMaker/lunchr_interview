class TransactionsController < ApplicationController
  def index
    render json: {},
           status: :ok
  end
end
