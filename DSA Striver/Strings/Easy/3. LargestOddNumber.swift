//
//  3. LargestOddNumber.swift
//  
//
//  Created by Arun on 30/03/25.
//

// LC: https://leetcode.com/problems/largest-odd-number-in-string/


public func largestOddNumber(_ num: String) -> String {
    guard var number = Int(num) else {
        return ""
    }
    
    if number % 2 != 0 {
        return String(number)
    }
    
    while number > 0 {
        let quotient = number / 10
        if quotient % 2 != 0 {
            return String(quotient)
        }
        
        number = quotient
    }
    
    return ""
}

public func largestOddNumber1(_ num: String) -> String {
    
    for i in stride(from: num.count - 1, to: -1, by: -1) {
        
        let index = num.index(num.startIndex, offsetBy: i)
        guard let intChar = Int("\(num[index])") else { break }
        
        if intChar % 2 != 0 {
            return String(num[num.startIndex...index])
        }
    }
    
    return ""
}
