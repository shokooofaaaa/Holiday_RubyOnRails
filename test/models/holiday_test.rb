require "test_helper"

class HolidayTest < ActiveSupport::TestCase

  fixtures :holidays
  test 'Holiday attributes from must not be empty' do
    holiday = Holiday.new
    assert holiday.invalid?
    assert_equal [I18n.translate('errors.messages.blank')],
                 holiday.errors[:from]

  end

   test 'holiday attributes to  must not be empty' do
    holiday = Holiday.new
    assert holiday.invalid?
    assert_equal [I18n.translate('errors.messages.blank')],
                 holiday.errors[:to]
  end

    test 'holiday attributes user_id  must not be empty' do
    holiday = Holiday.new
    assert holiday.invalid?
    assert_equal [I18n.translate('errors.messages.required')],
                 holiday.errors[:user]
  end




    test 'true' do
    holiday = Holiday.new(from: holidays(:one).from, to: holidays(:one).to, user: holidays(:one).user)

    assert holiday.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
