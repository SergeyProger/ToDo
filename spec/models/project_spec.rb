require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'Тест алидации' do

    it "Название проэкта" do
      should validate_presence_of(:name)
    end

    it "количество символов" do
    should validate_length_of(:name).is_at_most(100)
    end

  end

  describe 'Тест связей' do
    it { should have_many(:tasks) }
  end

end
