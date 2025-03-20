//
//  1. SquareRootNumber.swift
//  
//
//  Created by Arun on 20/03/25.
//

// TC -> O(sqrt(N))
public func sqrtN(n: Int) -> Int {
    var num = 0
    
    while num * num <= n {
        if num * num == n {
            return num
        }
        num += 1
    }
    
    return num - 1
}

// TC -> O(logN/2)
public func sqrtN2(n: Int) -> Int {
    
    if n <= 1 {
        return n
    }
    
    var low = 2, high = n / 2
    
    while low <= high {
        
        let mid = (low + high) / 2
        
        if mid * mid == n {
            return mid
        }
        else if mid * mid > n {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    return high
}
