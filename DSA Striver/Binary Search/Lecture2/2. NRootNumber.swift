//
//  2. NRootNumber.swift
//  
//
//  Created by Arun on 21/03/25.
//

import Foundation
//           __
// O(n *  n /m )
//        \/

public func NthRoot1(_ n: Int, _ m: Int) -> Int {
    var ans = 1
    
    var powerResult = 1
    
    while powerResult <= m {
        if powerResult == m {
            return ans
        }
        ans += 1
        powerResult = pow(ans, n)
    }
    
    return -1
}

private func pow(_ number: Int, _ power: Int) -> Int {
    var result = 1
    
    for _ in 1...power {
        result *= number
    }
    
    return result
}

// ---------------------------------------------

// TC -> O(LogN * n)
public func NthRoot2(_ n: Int, _ m: Int) -> Int {
    
    if n == 1 {
        return m
    }
    
    var low = 1, high = m / 2
    
    while low <= high {
        
        let mid = (low + high) / 2
        let result = pow(mid, n, m)
        
        switch result {
        case .equal: return mid
        case .greater: high = mid - 1
        case .less: low = mid + 1
        }
    }
    
    return -1
}

enum Comparison {
    case less, equal, greater
}

private func pow(_ number: Int, _ power: Int, _ m: Int) -> Comparison {
    var result = 1
    
    for _ in 1...power {
        result *= number
        
        // Edge case handled for overflow case.
        if result > m {
            return .greater
        }
    }
    
    return result == m ? .equal : .less
}


