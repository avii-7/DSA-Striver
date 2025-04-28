//
//  6. ShipPackages.swift
//
//
//  Created by Arun on 29/03/25.
//
private func getMaxAndSum(_ arr: [Int]) -> (max: Int, sum: Int) {
    
    var sum = 0
    var maxi = Int.min
    
    for ele in arr {
        sum += ele
        maxi = max(maxi, ele)
    }
    
    return (maxi, sum)
}
public func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
    
    let (maxi, sum) = getMaxAndSum(weights)
    
    for weight in maxi...sum {
        let calculatedDays = getCalculatedDays(for: weight, weights)
        if calculatedDays <= days {
            return weight
        }
    }
    
    return -1
}

public func shipWithinDays1(_ weights: [Int], _ days: Int) -> Int {
    
    var (low, high) = getMaxAndSum(weights)
    
    while low <= high {
        let mid = (low + high) / 2
        let calculatedDays = getCalculatedDays(for: mid, weights)
        
        if calculatedDays <= days {
            high = mid - 1
        }
        else if calculatedDays > days {
            low = mid + 1
        }
    }
    return low
}

private func getCalculatedDays(for targetWeight: Int, _ weights: [Int]) -> Int {
    var sum = 0
    var calculatedDays = 1
    
    for ele in weights {
        if sum + ele > targetWeight {
            sum = ele
            calculatedDays += 1
        }
        else {
            sum += ele
        }
    }
    
    return calculatedDays
}
