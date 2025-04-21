//
//  12. MedianOfTwoSortedArray.swift
//  
//
//  Created by Arun on 15/04/25.
//

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
