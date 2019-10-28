# MOCK PAYMENT SYSTEM

## REQUIREMENTS

Create a mock payment system:
1. Relations: 
    * Merchants have many payment transactions of different types 
    * Transactions are related (can navigate in-between)
    * Destroys all transactions, if merchant is deleted
    * Has merchant and admin user roles (UI) (optional)

2. Model fields: 
		* Merchant: name, description, email, status (active, inactive), total transaction sum(of all transactions)
    * Transaction: UUID, amount, status (processed, error)

3. Inputs and tasks:
    * Accepts payments using XML/JSON API (single point POST request)
    * Imports new merchants from CSV (rake task)
    * Has background job deleting transactions older than an hour (cron job)

4. Presentation:
    * Display, edit, destroy merchants
    * Display transactions


## Steps taken to implement

1. rvm gemset create - Ruby 2.5.3 & Rails 6.0

2. Created app structure with Rails new and did initial commit

3. Added 'rubocop' 
	
	- Fixed offence Missing magic comment # frozen_string_literal: true with commnad  "rubocop --only Style/FrozenStringLiteralComment -a"
	- Ran "rubocop -a" to fix some offences automatically

4. Added .rubocop.yml to configure cops

5. Added 'rspec-rails' & factory_bot_rails gems and created model classes

6. Wrting specs fist without defining models and writing migration to follow tdd

7. Added tramsaction api and its rspec

8. Added rake task to import merchants from csv file