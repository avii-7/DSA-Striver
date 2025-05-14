//
//  5. Isomorphic.swift
//  DSA Striver
//
//  Created by Arun on 13/05/25.
//

/*
 
 b -> f
 a -> o
 r -> o
 
 */

import RegexBuilder

/* Intution
 
 We need to create 2 mapping s -> t and t -> s.
 
 Check if mapping already exists return false else keep going.
 
 */

// TC -> O(s.count)
// SC -> O(s.count + t.count)
func isIsomorphic(_ s: String, _ t: String) -> Bool {
    var dict1 = Dictionary<Character, Character>()
    var dict2 = Dictionary<Character, Character>()
    
    for i in s.indices {
        
        let ch1 = s[i]
        let ch2 = t[i]
        
        if let value = dict1[ch1] {
            if value != ch2 {
                return false
            }
        }
        else {
            dict1[ch1] = ch2
        }
        
        if let value = dict2[ch2] {
            if value != ch1 {
                return false
            }
        }
        else {
            dict2[ch2] = ch1
        }
    }
    
    return true
}
