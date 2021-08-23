require "byebug"

class Array
  # ENUMERABLES: BLOCKS AND PROCS
  def my_each(&prc)
    self.map { |ele| prc.call(ele) }
  end

  # def my_each(&prc)
  #   i = 0
  #   while i < self.length
  #     prc.call(self[i])
  #     i += 1
  #   end
  #   self
  # end

  # def my_select(&prc)
  #   arr = []
  #   arr_flag = self.my_each(prc)

  #   (0...arr_flag.length).each do |i|
  #     arr << self[i] if self.my_each(prc)
  #   end
  # end


  def my_select(&prc)
    arr = []

    self.my_each { |ele| arr << ele if prc.call(ele) }
    arr
  end

  def my_reject(&prc)
    arr = []

    self.my_each { |ele| arr << ele unless prc.call(ele) }
    arr
  end

  # def my_any?(&prc)
  #   arr = self.my_select(&prc)
  #   arr.length > 1
  # end

  def my_any?(&prc)
    arr = []

    self.my_each { |ele| arr << ele if prc.call(ele) }
    arr.length > 1
  end

  # ARRAY METHODS
  def my_flatten  #how to pass without deforming array and calling argument
    result_arr = []

    (0...self.length).each do|i|
      if self[i].is_a?(Array) # if a number
        result_arr.concat(self[i].my_flatten)
      else
        result_arr << self[i]
      end
    end
    result_arr
  end
#---------------
  def my_zip (*args)
    result_arr = []
    combined_arr = [self] + args

    (0...combined_arr.length).each do |i|
      col_arr = []
      combined_arr.each do |row|
        col_arr << row[i]
      end
      result_arr << col_arr
    end
    result_arr
  end

  # to use my_rotate, just make a new array that does not have same memory address
  def my_rotate!(num=1)
    if num > 0
      num.times do
        ele = self.shift
        self.push(ele)
      end
    else
      opp_num = num * -1
      opp_num.times do
        ele = self.pop
        self.unshift(ele)
      end
    end
    self
  end

  def my_join(separator='')
    str = ''

    self.each_with_index do |ele, i|
      unless i == self.length - 1
        str += ele + separator
      else
        str += ele
      end
    end
    str
  end

  def my_reverse
    arr = []

    while self.length != 0
      arr << self.pop
    end
    arr
  end
end
