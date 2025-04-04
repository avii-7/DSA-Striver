//
//  9. AllocateBooks.swift
//  
//
//  Created by Arun on 01/04/25.
//

// LC: https://www.naukri.com/code360/problems/allocate-books_1090540

/*
 You have to allocate the book to ‘m’ students such that the maximum number of pages assigned to a student is minimum.
 
 Example: [25, 46, 28, 49, 24], students (m) = 4

(OLD Way)
assign books:   25, 46, 28, 49, 24    -> Max
                s | s | s |   s       -> 49 + 24 = 73
                s | s |   s   | s     -> 28 + 49 = 77
                s |   s   | s | s     -> 46 + 28 = 74
                  s   | s | s | s     -> 25 + 46 = 71
 
 And the minimum amoung them is 71.
 
 */

private func getStudents(targetpages: Int, from booksPages: [Int]) -> Int {
    
    var allocatedStudents = 1
    var pagesSum = 0
    
    for bookPages in booksPages {
        
        if pagesSum + bookPages <= targetpages {
            pagesSum += bookPages
        }
        else {
            allocatedStudents += 1
            pagesSum = bookPages
        }
    }
    
    return allocatedStudents
}

public func findPages(arr: [Int], n: Int, m: Int) -> Int {
    
    if m > arr.count {
        return -1
    }
    
    let (max, sum) = findMaxAndSum(arr: arr)
    
    if m == arr.count {
        return max
    }
    else if m == 1 {
        return sum
    }
    
    for i in max...sum {
        
        if getStudents(targetpages: i, from: arr) <= m {
            return i
        }
    }
    
    return -1
}

public func findPages2(arr: [Int], n: Int, m: Int) -> Int {
    
    if m > arr.count {
        return -1
    }
    
    let (max, sum) = findMaxAndSum(arr: arr)
    
    if m == arr.count {
        return max
    }
    else if m == 1 {
        return sum
    }
    
    var low = max, high = sum
    
    while low <= high {
        
        let mid = (low + high) / 2
        let students = getStudents(targetpages: mid, from: arr)
        
        if students <= m {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    return low
}
