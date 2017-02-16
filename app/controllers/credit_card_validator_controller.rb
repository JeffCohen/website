class CreditCardValidatorController < ApplicationController

  # 4000 0000 0000 0002
  def new
    cc_number = params['cc'].gsub(/\s/,'')

    digits = ''
    # double every other number starting with the next to last
    # and working backwards
    cc_number.split('').reverse.each_with_index do |d,i|
      digits += d if i%2 == 0
      digits += (d.to_i*2).to_s if i%2 == 1
    end

    # sum the resulting digits, mod with ten, check against 0
    retval = { success: digits.split('').inject(0){|sum,d| sum+d.to_i}%10 == 0 }

    render json: retval

  end

end
