require 'rails_helper'

RSpec.describe Post, type: :model do           
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end
end