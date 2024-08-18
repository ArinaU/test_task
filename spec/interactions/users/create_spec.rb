# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Create, type: :interaction do
  let(:valid_params) do
    {
      name: 'Иван',
      surname: 'Иванов',
      patronymic: 'Иванович',
      email: 'IVAN.IVANOV@EXAMPLE.COM',
      nationality: 'Русский',
      country: 'Россия',
      gender: 'male',
      age: 30,
      interests: ['Чтение', 'Футбол'],
      skills: ['Python']
    }
  end

  it 'creates a new user with interests and skills' do
    result = described_class.run(valid_params)

    expect(result).to be_valid
    user = result.result
    expect(user.name).to eq('Иван')
    expect(user.interests.map(&:name)).to match_array(['Чтение', 'Футбол'])
    expect(user.skills.map(&:name)).to match_array(['Python'])
  end

  it 'does not create a user with invalid email' do
    invalid_params = valid_params.merge(email: 'invalid_email')
    result = described_class.run(invalid_params)

    expect(result).not_to be_valid
    expect(User.count).to eq(0)
  end

  it 'downcases the email before saving' do
    result = described_class.run(valid_params.merge(email: 'IVAN.IVANOV@EXAMPLE.COM'))

    expect(result).to be_valid
    expect(result.result.email).to eq('ivan.ivanov@example.com')
  end

  it 'validates gender inclusion' do
    invalid_params = valid_params.merge(gender: 'unknown')
    result = described_class.run(invalid_params)

    expect(result).not_to be_valid
  end

  it 'validates age range' do
    invalid_params = valid_params.merge(age: 100)
    result = described_class.run(invalid_params)

    expect(result).not_to be_valid
  end

  it 'does not create a user without required fields' do
    invalid_params = valid_params.except(:name)
    result = described_class.run(invalid_params)

    expect(result).not_to be_valid
  end

  it 'creates interests and skills if they do not exist' do
    expect { described_class.run(valid_params) }.to change { Interest.count }.by(2).and change { Skill.count }.by(1)
  end
end