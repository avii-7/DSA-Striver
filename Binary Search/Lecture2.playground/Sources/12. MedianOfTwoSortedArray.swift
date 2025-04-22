//
//  12. MedianOfTwoSortedArray.swift
//  
//
//  Created by Arun on 15/04/25.
//

// Problem: https://leetcode.com/problems/median-of-two-sorted-arrays/

// TC -> O(n + m)
// SC -> O(n + m)
public func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var mergedArray = [Int]()
    var left = 0
    var right = 0
    
    let m = nums1.count
    let n = nums2.count
    
    while (left < m && right < n) {
        if nums1[left] < nums2[right] {
            mergedArray.append(nums1[left])
            left += 1
        }
        else {
            mergedArray.append(nums2[right])
            right += 1
        }
    }
    
    // collect leftovers
    
    while left < m {
        mergedArray.append(nums1[left])
        left += 1
    }
    
    while right < n {
        mergedArray.append(nums2[right])
        right += 1
    }
    
    let mid = mergedArray.count / 2
    if mergedArray.count % 2 == 0 {
        return Double(mergedArray[mid - 1] + mergedArray[mid]) / 2.0
    }
    else {
        return Double(mergedArray[mid])
    }
}


// Eliminating extra space
// TC -> O(n + m)
// SC -> O(1)
public func findMedianSortedArrays2(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var left = 0, right = 0
    
    let m = nums1.count
    let n = nums2.count
    
    var count = -1
    
    let targetIndex1 = (m + n) / 2
    let targetIndex2 = targetIndex1 - 1
    
    var ele1: Int? = nil
    var ele2: Int? = nil
    
    var skip = false
    
    while (left < m && right < n) {
        
        count += 1
        
        if nums1[left] < nums2[right] {
            
            if count == targetIndex1 {
                ele1 = nums1[left]
                skip = true
                break
            }
            else if count == targetIndex2 {
                ele2 = nums1[left]
            }
            left += 1
        }
        else {
            if count == targetIndex1 {
                ele1 = nums2[right]
                skip = true
                break
            }
            else if count == targetIndex2 {
                ele2 = nums2[right]
            }
            right += 1
        }
    }
    
    // check leftovers
    while left < m && skip == false {
        count += 1
        
        if count == targetIndex1 {
            ele1 = nums1[left]
            skip = true
            break
        }
        else if count == targetIndex2 {
            ele2 = nums1[left]
        }
        
        left += 1
    }
    
    while right < n && skip == false {
        count += 1
        
        if count == targetIndex1 {
            ele1 = nums2[right]
            skip = true
            break
        }
        else if count == targetIndex2 {
            ele2 = nums2[right]
        }
        right += 1
    }
    
    if (m + n) % 2 == 0 {
        return Double(ele1! + ele2!) / 2.0
    }
    else {
        return Double(ele1!)
    }
}

// TC: O(log(min(n,m))
// SC -> O(n + m)
public func findMedianSortedArrays3(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
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
    let isEven = (n1 + n2) % 2 == 0
    
    let division = (n1 + n2 + 1) / 2
    
    var low = 0, high = min(n1, n2)
    
    while low <= high {
        let mid1 = (low + high) / 2
        let mid2 = division - mid1
        
        // Check for valid symmetry
        
        let l1 = mid1 - 1 > -1 ? arr1[mid1 - 1] : Int.min
        let l2 = mid2 - 1 > -1 ? arr2[mid2 - 1] : Int.min
        
        let r1 = mid1 < n1 ? arr1[mid1] : Int.max
        let r2 = mid2 < n2 ? arr2[mid2] : Int.max
        
        if l1 <= r2 && l2 <= r1 {
            return getMedian(l1: l1, l2: l2, r1: r1, r2: r2, isEven: isEven)
        }
        else if l1 > r2 {
            high = mid1 - 1
        }
        else { // l2 > r1
            low = mid1 + 1
        }
    }
    
    return 0.0
    
    func getMedian(l1: Int, l2: Int, r1: Int, r2: Int, isEven: Bool) -> Double {
        
        if isEven {
            return (max(Double(l1), Double(l2)) + min(Double(r1), Double(r2))) / 2.0
        } else {
            return max(Double(l1), Double(l2))
        }
    }
}
