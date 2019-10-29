# frozen_string_literal: true

# Merchants Controller
class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end
end
