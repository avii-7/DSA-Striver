// Question Link: https://leetcode.com/problems/maximum-product-subarray/submissions/1477415313
// Article Link: https://takeuforward.org/data-structure/maximum-product-subarray-in-an-array/


// TC -> O(n * n)
// SC -> O(1)

func maxProductBrute(_ nums: [Int]) -> Int {
    
    var product = Int.min
    
    for i in nums.indices {
        
        var tempProduct = 1
        
        print("Starts at index: \(i)", terminator: ".....")
        
        for j in i..<nums.count {
            tempProduct *= nums[j]
            
            if tempProduct > product {
                product = tempProduct
                print("Ends: \(j)")
            }
        }
        print()
    }
    
    return product
}

//let nums = [2,3,-2,4]
//let nums = [2, -4, 2, -4, -5, 2, 6, 0]
//print(maxProductBrute(nums))


/* If you carefully think your maximum product subarray will always be prefix or suffix
 arround one negative number when your negative numbers count is odd.
 */

// TC -> O(n)
// SC -> O(1)

func maxProductOptimal(_ nums: [Int]) -> Int {
    
    let n = nums.count
    
    var product = Int.min
    
    var prefix = 1, suffix = 1
    
    for i in nums.indices {
        
        prefix *= nums[i]
        suffix *= nums[n - 1 - i]

        product = max(product, max(prefix, suffix))
        
        if prefix == 0 { prefix = 1 }
        if suffix == 0 { suffix = 1 }
    }
    
    return product
}

//let nums = [2,3,-2,4]
//let nums = [2, -4, 2, -4, -5, 2, 6, 0]
let nums = [-2, 0, -1]
print(maxProductOptimal(nums))
