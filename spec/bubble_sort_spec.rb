def bubble_sort(data)
  return data.reverse if data.size < 3

  loop do
    swaps = 0
    (0..data.size - 2).each do |i|
      if data[i + 1] < data[i]
        data[i], data[i + 1] = data[i + 1], data[i]
        swaps += 1
      end
    end

    break if swaps == 0
  end

  data
end

RSpec.describe 'bubble sort' do
  it 'compares side-by-side elements and sorts them in ascending order' do
    data = [2, 1]
    expect(bubble_sort(data)).to eq [1, 2]
  end

  it 'compares all side-by-side elements, sorting them' do
    data = [3, 1, 2]
    expect(bubble_sort(data)).to eq [1, 2, 3]
  end

  describe 'final' do
    it 'sorts the data' do
      data = [1, 3, 7, 2, 5]
      expect(bubble_sort(data)).to eq [1, 2, 3, 5, 7]
    end
  end
end