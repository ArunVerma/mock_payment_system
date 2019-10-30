# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Merchant Features' do
  it 'displays the text All Merchants' do
    visit('/merchants')
    expect(page).to have_content('All Merchants')
  end
end