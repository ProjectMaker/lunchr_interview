class TransactionsController < ApplicationController
  def index
    render json: Transaction.all,
           status: :ok
  end
end
