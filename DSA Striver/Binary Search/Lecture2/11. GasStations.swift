//
//  11. GasStations.swift
//  
//
//  Created by Arun on 12/04/25.
//


// https://www.naukri.com/code360/problems/minimise-max-distance_7541449

/* Minimize the Maximum Distance

   If you try to place k new gas stations at the extreme left or right,
   you cannot reduce the maximum distance between the existing gas stations.
   Let's take an example:

       [1, 7], k = 2

   Placing them at the extreme right: [1, 7, 8, 9]
   The maximum distance between adjacent gas stations is 6 in this case.
   But since we need to minimize the *maximum* distance, this is not optimal.
   Therefore, you should always place new gas stations between the existing ones.

   Example:
       [1, 13, 17, 23], k = 5

   The key idea is to place new gas stations wherever the distance between two adjacent stations is the greatest.
*/


// TC -> O(k * (n - 1)) + O(n - 1)
// SC -> O(n - 1)
public func minimiseMaxDistance(_ arr: [Int], _ k: Int) -> Double {
    
    var secArray = Array(repeating: 0, count: arr.count - 1)
    
    for _ in 1...k {
        
        var maxSecIndex = -1
        var maxSecValue = 0.0
        
        for i in 0...(arr.count - 2) {
            let diff = Double(arr[i + 1] - arr[i])
            let secValue: Double = diff / Double(secArray[i] + 1)
            
            if secValue > maxSecValue {
                maxSecValue = secValue
                maxSecIndex = i
            }
        }
        
        secArray[maxSecIndex] += 1
    }
    
    var maxDist: Double = 0
    
    for i in 0...(arr.count - 2) {
        let diff = Double(arr[i + 1] - arr[i])
        let secValue = diff / Double(secArray[i] + 1)
        maxDist = max(maxDist, secValue)
    }
    
    return maxDist
}

/*
 // Java Better solution using Priority Queue
 
 // By default in java, PQ arrange elements in ascending order, that's why I need to modified the comparing logic.
 
 // TC -> O(n * LogN) + O(k * logN)
 // SC -> O(n - 1) + O(n - 1)
 public static double MinimiseMaxDistance(int[] arr, int k) {
     PriorityQueue<Pair> pq = new PriorityQueue<>(new Comparator<Pair>() {
         @Override
         public int compare(Pair p1, Pair p2) {
             if (Double.compare(p2.distance, p1.distance) == 0) {
                 return Integer.compare(p2.index, p1.index);
             }
             return Double.compare(p2.distance, p1.distance);
         }
     });

     for (int i = 0; i < arr.length - 1; i++) {
         double distance = (double) (arr[i + 1] - arr[i]);
        // Every insert it takes LogN time so that elements remains sorted.
         pq.offer(new Pair(distance, i));
     }

     int[] secArray = new int[arr.length - 1];

     for (int i = 0; i < k; i++) {
         Pair top = pq.poll();
         int maxSecIndex = top.index;
         secArray[maxSecIndex]++;

         double distance = (double) (arr[maxSecIndex + 1] - arr[maxSecIndex]) / (secArray[maxSecIndex] + 1);
         pq.offer(new Pair(distance, maxSecIndex));
     }

     return pq.peek().distance;
 }

 private static class Pair {
     double distance;
     int index;

     Pair(double distance, int index) {
         this.distance = distance;
         this.index = index;
     }
 }
 
 */

public func minimiseMaxDistance2(_ arr: [Int], _ k: Int) -> Double {
    
    var maxDiff = 0
    
    for i in 0...arr.count - 2 {
        if arr[i + 1] - arr[i] > maxDiff {
            maxDiff = arr[i + 1] - arr[i]
        }
    }
    
    var low = 0.0, high = Double(maxDiff)
    
    while high - low > 1e-6 {
        let mid = (low + high) / 2.0
        
        let st = getStations(dist: mid, arr: arr)
        print("Distance: \(mid), st: \(st) low: \(low) high: \(high)")

        if st <= k {
            high = mid
        }
        else {
            low = mid
        }
    }
    
    return high
}

private func getStations(dist: Double, arr: [Int]) -> Int {
    var st = 0
    
    for i in 0...(arr.count - 2) {
        let diff = arr[i + 1] - arr[i]
        var newGasStationsInBetween = Double(diff) / dist
        
        // 1 / 0.4 = 2.5
        // When excatly divide take -1 => 1 / 0.5 = 2 ==> 1
        if Double(arr[i + 1] - arr[i]) == (dist * newGasStationsInBetween) {
            newGasStationsInBetween -= 1
        }

        st += Int(newGasStationsInBetween)
    }
    
    return st
}
