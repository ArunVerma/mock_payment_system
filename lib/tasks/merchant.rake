# frozen_string_literal: true

require 'csv'

namespace :merchants do
  desc 'Imports merchants from a csv file to database'
  task import: :environment do
    puts 'Import process started...'
    Merchant.transaction do
      CSV.foreach('merchants.csv', headers: true) do |row|
        param = { name: row[0], email: row[1], status: row[2], description: row[3] }
        Merchant.create!(param)
      end
    rescue StandardError => e
      puts "Error occured : #{e.message}"
      raise ActiveRecord::Rollback
    end
    puts 'Import completed successfully !!!'
  end
end
