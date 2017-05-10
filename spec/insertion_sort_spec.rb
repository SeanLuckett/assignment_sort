def insert(array, right_index, value)
  # value is the value of array[right_index + 1]
  # right_index is the furthest right sorted element

  # Step through sorted elements right to left.
  # As long as your value is less than the element
  # at array[i] and you still have elements
  i = right_index
  while i >= 0 && array[i] > value
    # copy the element
    array[i + 1] = array[i]
    i -= 1
  end

  # insert the actual element
  array[i + 1] = value
end

def insertion_sort(data)
  unsorted_start = 1

  unsorted_start.upto(data.length - 1) do |i|
    item = data[i]
    insert(data, i - 1, item)
  end

  data
end

RSpec.describe 'insertion sort' do
  describe '#insertion_sort' do
    it 'sorts some data' do
      data = [1, 3, 7, 2, 5]
      expect(insertion_sort(data)).to eq [1, 2, 3, 5, 7]
    end
  end
end