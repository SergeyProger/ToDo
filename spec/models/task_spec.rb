require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Тест алидации' do

    it "Название проэкта" do
      should validate_presence_of(:task_name)
    end

    it "количество символов" do
      should validate_length_of(:task_name).is_at_most(100)
    end

  end

  describe 'Тест связей' do
    it { should belong_to(:project) }
  end
end
