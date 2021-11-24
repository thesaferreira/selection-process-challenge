require 'rails_helper'

RSpec.describe User, type: :model do           
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end
end