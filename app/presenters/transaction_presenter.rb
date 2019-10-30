# frozen_string_literal: true

# Merchant Presenter
class TransactionPresenter < ApplicationPresenter
  def amount
    @template.number_to_currency(@model.amounts)
  end

  def merchant_name
    return nil unless @model.merchant

    @model.merchant.name
  end
end
