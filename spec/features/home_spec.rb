require 'spec_helper'

RSpec.describe 'Home features' do
  it 'displays welcome test on the homepage' do
    visit('/home')
    expect(page).to have_content('Welcome to Eugenes Mindscape Blog!')
  end
end
