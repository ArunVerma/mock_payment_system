# frozen_string_literal: true

# Transactions Controller
class Api::V1::TransactionsController < Api::V1::ApiController
  before_action :authenticate_merchant, except: [:index]

  # lists all transactions
  def index
    transactions = Transaction.all
    render json : {success: true, transactions: transactions.to_json}
  end

  # list all transactions for a particular merchant
  def merchant_transactions
    if @merchant.present?
      transactions = @merchant.transactions
      render json : {success: true, transactions: transactions.to_json}
    else
      render json: {errors: ["Merchant unauthorized"], status: :unauthorized}
    end
  end

  # saves transaction for a merchant
  def create
    if @merchant.present?
      transaction_params = ActiveSupport::HashWithIndifferentAccess.new(params[:transaction_params])
      transaction = @merchant.transactions.new(transaction_params)
      if transaction.save
        render json: {success: true, transaction_id: transaction.id}, status: 200
      else
        render json: { errors: "#{transaction.errors.full_messages.join(',')}" }, :status => :unprocessable_entity
      end
    else
      render json: {errors: ["Merchant unauthorized"], status: :unauthorized}
    end
  end

  private
  def authenticate_merchant
    if params[:merchant_id]
      @merchant = Merchant.find(params[:merchant_id])
      return nil unless @merchant.active?
    else
      @merchant = Merchant.where(email: params[:merchant_email]).active.last
    end
  end

  def transaction_params
    params.require(:transaction).permit(:uuid, :amount, :status, :merchant_email)
  end
end
