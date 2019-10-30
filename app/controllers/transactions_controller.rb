# frozen_string_literal: true

# Transactions Controller
class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.includes(:merchant).where(merchant_id: params[:merchant_id])
  end
end
