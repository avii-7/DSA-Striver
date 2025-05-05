//
//  4. FindPeakGrid.swift
//  DSA Striver
//
//  Created by Arun on 02/05/25.
//

// Brute Approach
// O(m * n)
func findPeakGrid(_ mat: [[Int]]) -> [Int] {
    
    let m = mat.count
    let n = mat.first!.count
    
    for rowIndex in mat.indices {
        
        for colIndex in mat[rowIndex].indices {
            
            let topElement = rowIndex - 1 >= 0 ? mat[rowIndex - 1][colIndex] : -1
            let leftElement = colIndex - 1 >= 0 ? mat[rowIndex][colIndex - 1] : -1
            
            let rightElement = colIndex + 1 < n ? mat[rowIndex][colIndex + 1] : -1
            let bottomElement = rowIndex + 1 < m ? mat[rowIndex + 1][colIndex] : -1
            
            let ele = mat[rowIndex][colIndex]
            
            if ele > topElement, ele > bottomElement, ele > leftElement, ele > rightElement {
                return [rowIndex, colIndex]
            }
        }
    }
    
    return []
}

// My Weird solution (Greedy): Just follow larger element.
// TC: - O(m * n)
func findPeakGrid1(_ mat: [[Int]]) -> [Int] {
    
    let m = mat.count
    let n = mat.first!.count
    
    var rowIndex = 0, colIndex = 0
    
    while true {
        let ele = mat[rowIndex][colIndex]
        
        let topElement = rowIndex - 1 >= 0 ? mat[rowIndex - 1][colIndex] : -1
        let leftElement = colIndex - 1 >= 0 ? mat[rowIndex][colIndex - 1] : -1
        
        let rightElement = colIndex + 1 < n ? mat[rowIndex][colIndex + 1] : -1
        let bottomElement = rowIndex + 1 < m ? mat[rowIndex + 1][colIndex] : -1
        
        if ele > topElement, ele > bottomElement, ele > leftElement, ele > rightElement {
            return [rowIndex, colIndex]
        }
        else if ele < topElement {
            rowIndex -= 1
        }
        else if ele < leftElement {
            colIndex -= 1
        }
        else if ele < rightElement {
            colIndex += 1
        }
        else if ele < bottomElement {
            rowIndex += 1
        }
    }
    
    return []
}

// TC -> Log(m) * n
// Here I'm applying BS on rows but you can also apply it on coloumns then TC will m * Log(n)
func findPeakGrid2(_ mat: [[Int]]) -> [Int] {
    
    let m = mat.count
    
    var low = 0, high = m - 1
    
    while low <= high {
        
        let mid = (low + high) / 2
        
        let maxIndex = findMaxIndex(mat[mid])
        
        // Is it also greater than top and bottom ? ( I'm using 'also' keyword here because that element is the maximum in their entire row)
        let topElement = mid - 1 >= 0 ? mat[mid - 1][maxIndex] : -1
        let bottomElement = mid + 1 < m ? mat[mid + 1][maxIndex] : -1
        
        if mat[mid][maxIndex] > topElement, mat[mid][maxIndex] > bottomElement {
            return [mid, maxIndex]
        }
        else if mat[mid][maxIndex] < topElement {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    return []
    
    func findMaxIndex(_ arr: [Int]) -> Int {
        
        var maxElementIndex = 0
        
        for index in arr.indices {
            if arr[index] > arr[maxElementIndex] {
                maxElementIndex = index
            }
        }
        
        return maxElementIndex
    }
}


