def merge_sort(array)
  # if the array is one element long, just return it
  return array if array.length == 1

  sorted = []

  mid_point = array.length / 2
  # merge_sort() the left half of the array
  left = merge_sort(array[0, mid_point])

  # merge_sort() the right half of the array
  remaining_items = array.length - mid_point
  right = merge_sort(array[mid_point, remaining_items])
  # merge() the two halves
  sorted = merge(left, right)

  # return the merged array
  sorted.flatten
end


def merge(left_array, right_array)
  merged_array = []

  until left_array.empty? && right_array.empty?
    left_item = left_array[0]
    right_item = right_array[0]

    if left_item.nil?
      merged_array << right_array.shift
      break
    elsif right_item.nil?
      merged_array << left_array.shift
      break
    end

    if left_item < right_item
      merged_array << left_array.shift
    else
      merged_array << right_array.shift
    end
  end

  merged_array.flatten
end

RSpec.describe 'merge sort' do
  context 'data set is one item' do
    it 'returns set of one item' do
      data = [42]
      expect(merge_sort(data)).to eq data
    end
  end

  context '2 item, unsorted data set' do
    it 'sorts set' do
      data = [81, 42]
      expect(merge_sort(data)).to eq data.reverse
    end
  end

  context '3+ item, unsorted data' do
    it 'sorts set' do
      data = [81, 42, 55]
      expect(merge_sort(data)).to eq [42, 55, 81]
    end

    it 'sorts set' do
      data = [81, 42, 55, 32]
      expect(merge_sort(data)).to eq [32, 42, 55, 81]
    end
  end

  describe 'merge' do
    context 'given to arrays' do
      let(:left_array) { [42, 81] }
      let(:right_array) { [32, 55] }

      it 'returns a combined, sorted list' do
        expect(merge(left_array, right_array)).to eq [32, 42, 55, 81]
        expect(merge([55], [32, 42])).to eq [32, 42, 55]
      end
    end
  end
end

