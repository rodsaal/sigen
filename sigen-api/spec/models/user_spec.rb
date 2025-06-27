# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:classroom) { create(:classroom) }
  let(:user) { build(:user, :student, classroom: classroom) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'invalid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a registration_number' do
    user.registration_number = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a role' do
    user.role = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a preferred_shift' do
    user.preferred_shift = nil
    expect(user).to_not be_valid
  end

  it 'has a unique registration number' do
    user.save!
    duplicate_user = build(:user, registration_number: user.registration_number)
    expect(duplicate_user).to_not be_valid
  end

  it 'has a registration_number starting with A if user is a student' do
    student = build(:user, :student)
    expect(student.registration_number).to start_with('A')
  end

  it 'has a registration_number starting with P if user is a teacher' do
    teacher = build(:user, :teacher)
    expect(teacher.registration_number).to start_with('P')
  end
end
