# frozen_string_literal: true

# Merchants Controller
class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.select('merchants.*, COUNT(transactions.id) as transaction_count')
                         .joins('LEFT OUTER JOIN transactions ON (transactions.merchant_id = merchants.id)')
                         .group('merchants.id')
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def destroy
    @merchant = Merchant.find(params[:id])
    @merchant.destroy
    redirect_to merchants_path
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])

    if @merchant.update(merchant_params)
      redirect_to merchants_path
    else
      render 'edit'
    end
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name, :email, :status, :description)
  end
end
