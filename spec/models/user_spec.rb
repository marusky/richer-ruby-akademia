require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(
      given_name: 'Martin',
      family_name: 'Thompson',
      email: 'test@test.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  context 'with all valid attributes' do
    it 'is valid' do
      expect(user).to be_valid
    end
  end

  context 'with empty given name' do
    it 'is invalid' do
      user.given_name = nil

      expect(user).not_to be_valid
    end
  end

  context 'with empty family name' do
    it 'is invalid' do
      user.family_name = nil

      expect(user).not_to be_valid
    end
  end

  context 'with erroneous password' do
    context 'with short password' do
      it 'is invalid' do
        user.password = '1234'
        user.password_confirmation = '1234'

        expect(user).not_to be_valid
      end
    end

    context 'without password confirmation' do
      it 'is invalid' do
        user.password_confirmation = ''

        expect(user).not_to be_valid
      end
    end

    context 'when passwords dont match' do
      it 'is invalid' do
        user.password_confirmation = 'xxxxxx'

        expect(user).not_to be_valid
      end
    end
  end

  describe '#full_name' do
    it "returns user's full name" do
      expect(user.full_name).to eq('Martin Thompson')
    end
  end
end
