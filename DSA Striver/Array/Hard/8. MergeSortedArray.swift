//
//  8. MergeSortedArray.swift
//  DSA Striver
//
//  Created by Arun on 28/04/25.
//

//: [Previous](@previous)

// TC -> O (n * m)
func mergeBrute(_ nums1: inout [Int], _ nums2: inout [Int]) {
//    let m = nums1.count
    let n = nums2.count

    for i in nums1.indices {
        if nums1[i] > nums2[0] {
            let place = nums1[i]
            nums1[i] = nums2[0]
            
            var placeAtLast = true
            
            for k in 1..<n {
                if place > nums2[k] {
                    nums2[k-1] = nums2[k]
                }
                else if place <= nums2[k] {
                    nums2[k - 1] = place
                    placeAtLast = false
                    break
                }
            }
            
            if placeAtLast {
                nums2[n - 1] = place
            }
        }
    }
}

//var nums1 = [1, 8, 8], nums2 = [3, 4, 5, 5]
//var nums1 = [1, 1, 1, 1], nums2 = [2, 2, 3, 3, 5]
//var nums1 = [0,0,0, 1, 2, 3], nums2 = [2,5,6]
//mergeBrute(&nums1, &nums2)
//print(nums1, nums2)

// TC -> O(min(m,n)) + nLog(n) + mLog(m)
func mergeBrute1(_ nums1: inout [Int], _ nums2: inout [Int]) {
    let n = nums2.count

    var j = 0
    
    for i in stride(from: nums1.count - 1, to: -1, by: -1) where j < n {
        if nums1[i] > nums2[j] {
            (nums1[i], nums2[j]) = (nums2[j], nums1[i])
            j += 1
        }
        else {
            break
        }
    }
    
    nums1.sort()
    nums2.sort()
}

//var nums1 = [1, 8, 8], nums2 = [3, 4, 5, 5]
//var nums1 = [1, 1, 1, 1], nums2 = [2, 2, 3, 3, 5]
//var nums1 = [0,0,0, 1, 2, 3], nums2 = [2,5,6]
//mergeBrute1(&nums1, &nums2)
//print(nums1, nums2)
