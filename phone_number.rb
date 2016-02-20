# launchschool phone number clean-up challenge
class PhoneNumber
  attr_reader :number

  def initialize(num)
    @number = num.gsub(/\W/, '')
    validate_number
  end

  def validate_number
    if !(@number =~ /[a-zA-z]/).nil? || !(10..11).cover?(@number.size)
      @number = '0000000000'
    end

    validate_intl if @number.size == 11
  end

  def validate_intl
    if @number[0] != '1'
      @number = '0000000000'
    else
      @number = @number[1..-1]
    end
  end

  def area_code
    @number[0..2]
  end

  def to_s
    "(#{@number[0..2]}) #{@number[3..5]}-#{@number[6..-1]}"
  end
end
