//
//  7. ValidAnagram.swift
//  DSA Striver
//
//  Created by Arun on 22/05/25.
//

// LC: - https://leetcode.com/problems/valid-anagram

// TC -> O(n + 26)
// SC -> O(26)
func isAnagram(_ s: String, _ t: String) -> Bool {
    
    if s.count != t.count { return false }
    
    var dict = [Character: Int]()
    
    // -> O(n)
    for i in s.indices {
        dict[s[i], default: 0] += 1
        dict[t[i], default: 0] -= 1
    }
    
    // -> O(26)
    for (_, value) in dict {
        if value != 0 {
            return false
        }
    }
    
    return true
}

// TC -> O(n + 26)
// SC -> O(26)
func isAnagram1(_ s: String, _ t: String) -> Bool {
    
    if s.count != t.count { return false }
    
    //a --> Optional(97)
    let const = 97
    var arr = Array<Int>(repeating: 0, count: 26)
    
    // -> O(n)
    for i in s.indices {
        arr[getAscii(s[i]) - const] += 1
        arr[getAscii(t[i]) - const] -= 1
    }
    
    // -> O(26)
    for value in arr {
        if value != 0 {
            return false
        }
    }
    
    return true
    
    func getAscii(_ ch: Character) -> Int {
        Int(ch.asciiValue!)
    }
}
