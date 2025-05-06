//
//  5. FindMedian.swift
//  DSA Striver
//
//  Created by Arun on 06/05/25.
//

// Problem Link: https://www.naukri.com/code360/problems/median-of-a-row-wise-sorted-matrix_1115473

// Brute approach

// TC -> O( ((m * m + 1) / 2 - 1) * n)
// SC -> O(m * n)

// Intuition: I will merge every row and then find the median.
// I'm storing previous merged rows result so that I can use that with the next row. And at every merging my temp array is growing which will result my next merging will take more time.

/* Example
 m = 5, n = 3
 1 5 7
 2 3 4
 4 6 7
 6 8 9
 1 2 3
 
 --- temp = firstRow
 At first Iteration:
 temp + secondRow => TC - O(n) + O(n) ---- O(2n)
 
 Second Iteration: (temp size is 2n from previous result)
 temp + thirdRow => TC - O(2n) + O(n) ---- O(3n)
 
 Third Iteration: (temp size: 3n)
 temp + fourthRow => TC - O(3n) + O(n) --- O(4n)
 
 Forth Iteration: (temp size: 4n)
 temp + fithRow => TC - O(4n) + O(n) ----- O(5n)
 
 Total TC -> O(14n) => O( ((m * (m + 1)) / 2) - 1 * n)
 */
func findMedian(matrix: [[Int]]) -> Int {
    let m = matrix.count, n = matrix.first!.count
    
    var temp = matrix.first!
    
    for rowIndex in 1..<matrix.count {
        
        let secondArray = matrix[rowIndex]
        
        var left = 0, right = 0
        
        var mergedArray = [Int]()
        
        while left < temp.count && right < secondArray.count {
            
            if temp[left] < secondArray[right] {
                mergedArray.append(temp[left])
                left += 1
            }
            else {
                mergedArray.append(secondArray[right])
                right += 1
            }
        }
        
        // Collect leftovers
        while left < temp.count {
            mergedArray.append(temp[left])
            left += 1
        }
        
        while right < secondArray.count {
            mergedArray.append(secondArray[right])
            right += 1
        }
        
        temp = mergedArray
    }
    
    return temp[temp.count / 2]
}
