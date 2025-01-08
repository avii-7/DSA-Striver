
/*
 Floor of 'x' is the largest element in the array which is smaller than or equal to 'x'.
 Ceiling of 'x' is the smallest element in the array greater than or equal to 'x'.
 */

// TC -> O(n)
func getFloorAndCeilBrute(a: [Int], n: Int, x: Int) -> [Int] {
    var floor = -1, ceil = -1
    
    for i in a.indices {
        
        if x == a[i] {
            floor = a[i]
            ceil = a[i]
            break
        }
        else if x > a[i] {
            floor = a[i]
        }
        else {
            ceil = a[i]
            break
        }
    }
    
    return [floor, ceil]
}

// TC -> O(LogN)
func getFloorAndCeilOptimal(a: [Int], n: Int, x: Int) -> [Int] {
    var floor = -1, ceil = -1
    var low = 0, high = n - 1
    
    while low <= high {
        
        let mid = (low + high)/2
        
        if a[mid] == x {
            return [a[mid], a[mid]]
        }
        else if x < a[mid] {
            high = mid - 1
            ceil = a[mid]
        }
        else {
            low = mid + 1
            floor = a[mid]
        }
    }
    
    return [floor, ceil]
}

let n = 6, x = 5, a = [3, 4, 7, 8, 8, 10]
getFloorAndCeilOptimal(a: a, n: n, x: x)
