class SortedArray
  attr_accessor :internal_arr

  def initialize(input_arr=[])
    @internal_arr = []
    input_arr.each do |element|
      self.add(element)
    end
  end

  def add(new_ele)
    @internal_arr.insert(first_larger_index(new_ele), new_ele)
  end

  def size
    @internal_arr.size
  end
  def [](index)
    @internal_arr[index]
  end

  def first_larger_index_rec(target, start_ind=0, end_ind=@internal_arr.size)
    mid_ind = (end_ind-start_ind)/2 + start_ind

    # Get the halfway element
    mid_ele = @internal_arr[mid_ind]

    if start_ind == end_ind
      if mid_ind == @internal_arr.size || mid_ele > target
        return mid_ind
      else # mid_ele <= target
        return mid_ind + 1
      end
    elsif mid_ele > target
      # Since the middle element is > than the target
      # We know the first larger element index is <= mid_ind
      first_larger_index(target, start_ind, mid_ind)
    elsif mid_ele < target
      # Since the middle element is < than the target
      # We know the first larger element index is > mid_ind
      first_larger_index(target, mid_ind+1, end_ind)
    else # mid_ele == target, so the new element can go on either side
      mid_ind
    end
  end

  def first_larger_index(target, start_ind=0, end_ind=@internal_arr.size)
    start_ind = 0
    end_ind = @internal_arr.size

    while start_ind <= end_ind
      # Calculate the halfway location
      mid_ind = (end_ind-start_ind)/2 + start_ind

      # Get the halfway element
      mid_ele = @internal_arr[mid_ind]

      if start_ind == end_ind
        if mid_ind == @internal_arr.size || mid_ele > target
          return mid_ind
        else # mid_ele <= target
          return mid_ind + 1
        end
      elsif mid_ele > target
        # Since the middle element is > than the target
        # We know the first larger element index is <= mid_ind
        end_ind = mid_ind
      elsif mid_ele < target
        # Since the middle element is < than the target
        # We know the first larger element index is > mid_ind
        start_ind = mid_ind + 1
      else # mid_ele == target, so the new element can go on either side
        return mid_ind
      end
    end
  end

  def index(target, start_ind=0, end_ind=@internal_arr.length)
     # If start_ind > end_ind, the target can't be in the search space.
    until start_ind >= end_ind
      # Calculate the halfway point
      mid_ind = (end_ind-start_ind)/2 + start_ind
      # Get the halfway element
      mid_ele = @internal_arr[mid_ind]
      # Is the target right in the middle?
      if mid_ele == target
        return mid_ind # return it.
      elsif mid_ele > target
        # Since the middle element is > than the target
        # We know the target is in the left half of the search space
        end_ind = mid_ind
      elsif mid_ele < target
        # Since the middle element is < than the target
        # We know the target is in the right half of the search space
        start_ind = mid_ind + 1
      end
    end
    return nil
  end
end
