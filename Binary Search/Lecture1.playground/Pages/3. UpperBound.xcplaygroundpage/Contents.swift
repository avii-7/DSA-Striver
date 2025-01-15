// Problem:
// Upper Bound: smallest Index but arr[Idx] > x

// TC -> O(n)
func upperBound(arr: [Int], n: Int, x: Int) -> Int {
    
    for i in arr.indices {
        if x < arr[i] {
            return i
        }
    }
    
    return arr.count
}

// TC -> O(log(n))
func upperBound(arr: [Int], k: Int) -> Int {
    
    var low = 0, high = arr.count - 1
    var ans = arr.count
    
    while(low <= high) {
        var mid = (low + high) / 2
        
        if k < arr[mid] {
            high = mid - 1
            ans = mid
        }
        else {
            low = mid + 1
        }
    }
    
    return ans
}

let arr = [1, 2, 8, 10, 11, 12, 19]
let k = 12
print(upperBound(arr: arr, k: k))
