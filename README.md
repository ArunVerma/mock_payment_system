# MOCK PAYMENT SYSTEM

1. rvm gemset create - Ruby 2.5.3 & Rails 6.0

2. Created app structure with Rails new and did initial commit

3. Added 'rubocop' 
	
	- Fixed offence Missing magic comment # frozen_string_literal: true with commnad  "rubocop --only Style/FrozenStringLiteralComment -a"
	- Ran "rubocop -a" to fix some offences automatically

4. Added .rubocop.yml to configure cops

5. Added 'rspec-rails' & factory_bot_rails gems and created model classes

6. Wrting specs fist without defining models and writing migration to follow tdd