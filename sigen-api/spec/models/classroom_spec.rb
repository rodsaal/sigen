require 'rails_helper'

RSpec.describe Classroom, type: :model do
  it 'is valid with valid attributes' do
    classroom = build(:classroom)
    expect(classroom).to be_valid
  end

  it 'is invalid without a grade' do
    classroom = build(:classroom, grade: nil)
    expect(classroom).to_not be_valid
  end

  it 'is invalid without a shift' do
    classroom = build(:classroom, shift: nil)
    expect(classroom).to_not be_valid
  end

  it 'is invalid without a year' do
    classroom = build(:classroom, year: nil)
    expect(classroom).to_not be_valid
  end

  it 'generates a code with the correct pattern' do
    classroom = build(:classroom, shift: 'morning', grade: 6)
    expect(classroom.code).to match(/^1[6-9]0[1-3]$/)
  end
end
