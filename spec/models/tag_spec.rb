require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'validations' do
    it { should have_many(:taggings) }
  end
end
