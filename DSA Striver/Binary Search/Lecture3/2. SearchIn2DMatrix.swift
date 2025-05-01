//
//  2. SearchIn2DMatrix.swift
//  DSA Striver
//
//  Created by Arun on 29/04/25.
//

// LC: https://leetcode.com/problems/search-a-2d-matrix
// Article: https://takeuforward.org/data-structure/search-in-a-sorted-2d-matrix/

/*
 You are given an m x n integer matrix matrix with the following two properties:
 
 Each row is sorted in non-decreasing order.
 The first integer of each row is greater than the last integer of the previous row.
 Given an integer target, return true if target is in matrix or false otherwise.
 
 You must write a solution in O(log(m * n)) time complexity.
 */

// Brute
// TC: - O(n * m)
public func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    
    for row in matrix {
        
        for ele in row {
            if ele == target {
                return true
            }
        }
    }
    
    return false
}

private func isExistsByBS(_ arr: [Int], _ target: Int) -> Bool {
    let n = arr.count
    
    var low = 0, high = n - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        if arr[mid] == target {
            return true
        }
        else if arr[mid] > target {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    return false
}

// Better
// TC: - O(m) + log(n)
public func searchMatrix1(_ matrix: [[Int]], _ target: Int) -> Bool {
    
    let m = matrix.count, n = matrix[0].count
    
    if target < matrix[0][0] || target > matrix[m - 1][n - 1] {
        return false
    }
    
    for row in matrix {
        
        if target >= row.first! && target <= row.last! {
            return isExistsByBS(row, target)
        }
    }
    
    return false
}

// Optimal
// TC: - O(logm + logn) or log(m * n)
public func searchMatrix2(_ matrix: [[Int]], _ target: Int) -> Bool {
    
    /// m = rows, n = columns
    let m = matrix.count, n = matrix[0].count
    
    if target < matrix[0][0] || target > matrix[m - 1][n - 1] {
        return false
    }
    
    var low = 0, high = m - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        if matrix[mid][0] == target {
            return true
        }
        else if matrix[mid][0] > target {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    return isExistsByBS(matrix[high], target)
}

// Optimal 2 (Cleaned Version)
// TC: - log(m * n)
public func searchMatrix3(_ matrix: [[Int]], _ target: Int) -> Bool {
    
    /// m = rows, n = columns
    let m = matrix.count, n = matrix[0].count
    
    if target < matrix[0][0] || target > matrix[m - 1][n - 1] {
        return false
    }
    
    var low = 0, high = m * n - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        let rowIndex = mid / n
        let columnIndex = mid % n
        
        if matrix[rowIndex][columnIndex] == target {
            return true
        }
        else if matrix[rowIndex][columnIndex] > target {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    return false
}

