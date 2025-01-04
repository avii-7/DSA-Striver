// LC: -> https://leetcode.com/problems/move-zeroes/
// Article: -> https://takeuforward.org/data-structure/move-all-zeros-to-the-end-of-the-array/

// TC -> O(n)
// SC -> O(n)
func moveZeroesBrute(_ nums: inout [Int]) {
    var arr = Array(repeating: 0, count: nums.count)
    
    var i = 0
    for ele in nums {
        if ele != 0 {
            arr[i] = ele
            i += 1
        }
    }
    
    nums = arr
}

// TC -> O(n*n)
// SC -> O(1)
func moveZeroesBest(_ nums: inout [Int]) {
    
    for i in nums.indices {

        if nums[i] != 0 {
            var j = i - 1
            while(j > -1 && nums[j] == 0) {
                j -= 1
            }
            let ele = nums[i]
            nums[i] = 0
            nums[j + 1] = ele
        }
    }
}

func moveZeroesOptimal(_ nums: inout [Int]) {
    // Find first zero
    
    var j = -1
    for i in nums.indices {
        if nums[i] == 0 {
            j = i
            break
        }
    }
    
    if j == -1 { return }
    
    for i in stride(from: j + 1, to: nums.count, by: 1) {
        if nums[i] != 0 {
            nums[j] = nums[i]
            nums[i] = 0
            j += 1
        }
    }
}

//var arr = [0, 1, 0, 3, 12]
//var arr = [0, 1, 0, 3, 12, 5, 6, 7, 0, 0, 1]
var arr = [0, 0, 0, 1, 2, 3]
moveZeroesOptimal(&arr)

print(arr)
