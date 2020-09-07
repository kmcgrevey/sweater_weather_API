require 'rails_helper'

RSpec.describe 'Root page', type: :feature do
  it 'should display basic message' do
    visit root_path
    expect(page).to have_content("Sweater Weather API")
  end
end