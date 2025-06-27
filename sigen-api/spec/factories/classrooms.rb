FactoryBot.define do
  factory :classroom do
    grade { rand(6..9) }
    shift { %w[morning afternoom].sample }
    year  { Time.current.year }

    code do
      shift_digit = shift == 'morning' ? '1' : '2'
      grade_digit = grade.to_s
      suffix = %w[01 02 03].sample
      "#{shift_digit}#{grade_digit}#{suffix}"
    end
  end
end
