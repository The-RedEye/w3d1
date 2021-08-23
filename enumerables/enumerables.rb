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



end
