//
//  13. KthElementOfTwoSortedArray.swift
//  
//
//  Created by Arun on 24/04/25.
//

// Naukri: https://www.naukri.com/code360/problems/k-th-element-of-2-sorted-array_1164159

// TC -> O(n + m)
// SC -> O(n + m)
public func kthElement(arr1: [Int], arr2: [Int], k: Int) -> Int {
    var mergedArray = [Int]()
    
    let m = arr1.count
    let n = arr2.count
    
    var left = 0, right = 0
    
    while (left < m && right < n) {
        
        if arr1[left] < arr2[right] {
            mergedArray.append(arr1[left])
            left += 1
        }
        else {
            mergedArray.append(arr2[right])
            right += 1
        }
    }
    
    while left < m {
        mergedArray.append(arr1[left])
        left += 1
    }
    
    while right < n {
        mergedArray.append(arr2[right])
        right += 1
    }
    
    return mergedArray[k - 1]
}

// TC -> O(n + m)
public func kthElement1(arr1: [Int], arr2: [Int], k: Int) -> Int {
    
    let m = arr1.count
    let n = arr2.count
    
    var left = 0, right = 0
    var count = -1
    
    let targetIndex = k - 1
    
    while (left < m && right < n) {
        
        count += 1
        
        if arr1[left] < arr2[right] {
            if count == targetIndex {
                return arr1[left]
            }
            
            left += 1
        }
        else {
            if count == targetIndex {
                return arr2[right]
            }
            right += 1
        }
    }
    
    while left < m {
        count += 1
        if count == targetIndex {
            return arr1[left]
        }
        left += 1
    }
    
    while right < n {
        count += 1
        if count == targetIndex {
            return arr2[right]
        }
        right += 1
    }
    
    return Int.min
}


// Problem: k is lesser than mid2.
public func kthElement2(nums1: [Int], nums2: [Int], k: Int) -> Int {
    
    if k == 1 {
        return Int(min(nums1[0], nums2[0]))
    }
    
    let arr1: [Int]
    let arr2: [Int]
    
    if nums1.count < nums2.count {
        arr1 = nums1
        arr2 = nums2
    }
    else {
        arr1 = nums2
        arr2 = nums1
    }
    
    let n1 = arr1.count
    let n2 = arr2.count
    
    let division = k
    
    var low = max(0, k - n2), high = min(n1, k)
    
    while low <= high {
        // Here mid1 respresents number of elements I will take from arr1
        let mid1 = (low + high) / 2
        let mid2 = division - mid1
        
        let l1 = mid1 - 1 > -1 ? arr1[mid1 - 1] : Int.min
        let l2 = mid2 - 1 > -1 ? arr2[mid2 - 1] : Int.min
        
        let r1 = mid1 < n1 ? arr1[mid1] : Int.max
        let r2 = mid2 < n2 ? arr2[mid2] : Int.max
        
        if l1 <= r2 && l2 <= r1 {
            return max(l1, l2)
        }
        else if l1 > r2 {
            high = mid1 - 1
        }
        else { // l2 > r1
            low = mid1 + 1
        }
    }
    
    return Int.min
}
