# frozen_string_literal: true

# Merchant Presenter
class MerchantPresenter < ApplicationPresenter
  def transactions_count
    @model.transaction_count
  end

  def transaction_amount
    @template.number_to_currency(@model.transactions_sum)
  end
end
