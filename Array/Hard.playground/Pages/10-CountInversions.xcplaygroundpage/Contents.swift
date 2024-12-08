// Question https://www.geeksforgeeks.org/problems/inversion-of-array-1587115620/1

// Condition -> arr[i] > arr[j] and i < j

// Brute Force Approach
// TC-> O(n * n)
func inversionCountBrute(arr: [Int]) -> Int {
    var count = 0
    
    for i in arr.indices {
        for j in i+1..<arr.count {
            if arr[i] > arr[j] {
                count += 1
            }
        }
    }
    
    return count
}

//let arr = [2, 4, 1, 3, 5]
//print(inversionCountBrute(arr: arr))

// TC -> O(nLogn)
// SC -> O(n)

func inversionCountOptimal(arr: inout [Int]) -> Int {
    let count =  merge(arr: &arr, low: 0, high: arr.count - 1)
    print(arr)
    return count
}

func merge(arr: inout [Int], low: Int, high: Int) -> Int {
    var count = 0
    if low == high {
        return count
    }
    
    let mid = (low + high) / 2
    
    count += merge(arr: &arr, low: low, high: mid)
    count += merge(arr: &arr, low: mid + 1, high: high)
    count += combine(arr: &arr, low: low, mid: mid, high: high)
    return count
}

func combine(arr: inout [Int], low: Int, mid: Int, high: Int) -> Int {
    var count = 0
    
    var left = low
    var right = mid + 1
    
    var temp = [Int]()
    
    while(left <= mid && right <= high) {
        
        // Please take care, in this problem it is always (<=) because inversion condition is
        // arr[i] > arr[j] and i < j. But in merge sort you can consider any one either < or <=.
        if arr[left] <= arr[right] {
            temp.append(arr[left])
            left += 1
        }
        else {
            count += mid - left + 1
            temp.append(arr[right])
            right += 1
        }
    }
    
    while(left <= mid) {
        temp.append(arr[left])
        left += 1
    }
    
    while(right <= high) {
        temp.append(arr[right])
        right += 1
    }
    
    for i in stride(from: low, to: high + 1, by: 1) {
        arr[i] = temp[i - low]
    }
    
    return count
}

//var arr = [2, 4, 1, 3, 5]
//var arr = [10, 10, 10]
var arr = [57, 38, 91, 10, 38, 28, 79, 41]
print(inversionCountOptimal(arr: &arr))
