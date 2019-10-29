# frozen_string_literal: true

require 'sidekiq-scheduler'
# Worker to check for transaction older than an hour
class TransactionWorker
  include Sidekiq::Worker

  def perform(*args)
    puts 'started process to delete transactions older than an hour'
    Transaction.where('created_at < ?', 1.hours.ago).find_in_batches do | group |
      # need to check if group.destroy_all works here
    	group.each do |transaction|
        transaction.destroy
      end
    end
    puts "Complete !!!"
  end
end
