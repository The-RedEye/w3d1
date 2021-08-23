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

  # ARRAY
  def my_flatten  #how to pass without deforming array and calling argument
    result_arr = []

    # if self == []
    #   return
    # end

    (0...self.length).each do|i|
      # debugger
      if self[i].is_a?(Array) # if a number
        # debugger
        result_arr.concat(self[i].my_flatten)
      else
        # debugger
        result_arr << self[i]
      end
    end

    result_arr

  
  end
#---------------
  def my_zip (*args)
    result_arr = []
    
    combined_arr = [self] + args

    # max_arr=combined_arr.inject do |accum, sub_arr|
    #   if accum.length<=sub_arr.length
    #       sub_arr
    #   else
    #       accum
    #   end
    # end

    # # result_arr = Array.new(max_arr.length, 0)

    (0...combined_arr.length).each do |i|
      col_arr = [] 
          # debugger
        # result_arr = Array.new(max_arr.length, 0)
      
      combined_arr.each do |row|
        col_arr << row[i]
      end

      result_arr << col_arr
      # debugger
    end

    return result_arr

  end


end
