//
//  4. LongestCommonPrefix.swift
//  DSA Striver
//
//  Created by Arun on 12/05/25.
//

// LC: https://leetcode.com/problems/longest-common-prefix

// TC -> O(min(strs) * n)
// SC -> O(str.first!.count)

func longestCommonPrefix(_ strs: [String]) -> String {
    
    if strs.count == 1 {
        return strs.first!
    }
    
    guard let temp = strs.first, !temp.isEmpty else {
        return ""
    }
    
    var endIndex: String.Index? = nil
    
    outerLoop:
    for index in temp.indices {
        for str in strs {

            if str.isEmpty {
                return ""
            }
            
            if index >= str.endIndex || str[index] != temp[index] {
                break outerLoop
            }
        }
        endIndex = index
    }
    
    if let endIndex {
        return String(temp[...endIndex])
    }
    
    return ""
}
