# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Merchant Features', type: :feature do
  before(:each) do
    visit merchants_path
  end

  context 'list all merchant' do
    scenario 'should see all merchants' do
      create(:merchant)
      expect(page).to have_content('All Merchants')
    end

    scenario 'should see link for view, edit and destroy' do
      create(:merchant)
      visit merchants_path
      expect(page).to have_link('View')
      expect(page).to have_link('Edit')
      expect(page).to have_link('Destroy')
    end
  end

  context 'update merchant' do
    scenario 'should be successful' do
      merchant = create(:merchant)
      visit edit_merchant_path(merchant)
      within('form') do
        fill_in 'Name', with: 'Test Merchant'
        fill_in 'Email', with: 'test.merchant@example.com'
        fill_in 'Description', with: 'This is testing'
      end
      click_button 'Update Merchant'
      expect(page).to have_content 'Merchant was successfully updated.'
      expect(page).to have_content 'test.merchant@example.com'
    end

    scenario 'should fail' do
      merchant = create(:merchant)
      visit edit_merchant_path(merchant)
      within('form') do
        fill_in 'Name', with: ''
      end
      click_button 'Update Merchant'
      expect(page).to have_content 'Name can\'t be blank'
    end
  end

  context 'destroy merchant' do
    scenario 'should be successful' do
      create(:merchant)
      visit merchants_path
      accept_confirm do
        click_link 'Destroy'
      end
      expect(page).to have_content 'Merchant was successfully destroyed.'
    end
  end
end
