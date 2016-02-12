require 'date'
require 'time'

# meetup challenge
class Meetup
  WEEKDAY_CODES = { monday: 1, tuesday: 2, wednesday: 3,
                    thursday: 4, friday: 5, saturday: 6, sunday: 7 }
  WEEKDAY_SEQ = { first: 1, second: 2, third: 3, fourth: 4,
                  last: 5, teenth: 1000 }
  TEENS = (13..19).to_a

  def initialize(month, year)
    @month = month
    @year = year
    @day_num = 1
  end

  def find_weekday(day_num_needed)
    d = Date.new(@year, @month, @day_num)

    weekday = d.strftime('%u').to_i
    if weekday < WEEKDAY_CODES[day_num_needed]
      @day_num += (WEEKDAY_CODES[day_num_needed] - weekday)
    elsif weekday > WEEKDAY_CODES[day_num_needed]
      @day_num += (7 - weekday + WEEKDAY_CODES[day_num_needed])
    end
  end

  def day(day_num_needed, week_num_needed)
    find_weekday(day_num_needed)
    week_num = 1
    days_n_mth = Date.civil(@year, @month, -1).day


    while @day_num < days_n_mth
      break if (week_num == WEEKDAY_SEQ[week_num_needed]) ||
               (week_num_needed == :teenth && TEENS.include?(@day_num)) ||
               (@day_num + 7 > days_n_mth)

      @day_num += 7
      week_num += 1
    end

    Date.new(@year, @month, @day_num)
  end
end
