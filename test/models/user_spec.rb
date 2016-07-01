require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires battery_identifier' do
      batt = FactoryGirl.build(:battery, battery_identifier: nil)
      expect(batt).to_not be_valid
    end
  end
end
