//
//  main.swift
//  DSA Striver
//
//  Created by Arun on 28/04/25.
//

import Foundation

// MARK: - Binary Search

// Lecture 3

// Problem: 74. Search a 2D Matrix
//execute(
//    inputs: [([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3), ([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13)],
//    expectedOutputs: [true, false],
//    for: searchMatrix3
//)

// Problem: 240. Search a 2D Matrix II
//execute(
//    inputs: [
//        (
//            [
//                [1,4,7,11,15],
//                [2,5,8,12,19],
//                [3,6,9,16,22],
//                [10,13,14,17,24],
//                [18,21,23,26,30]
//            ],
//            5
//        ),
//        (
//            [
//                [1,4,7,11,15],
//                [2, 5, 8, 12, 19],
//                [3,6,9,16,22],
//                [10,13,14,17,24],
//                [18,21,23,26,30]
//            ],
//            20
//        )
//    ],
//    expectedOutputs: [true, false],
//    for: searchMatrix2DII2
//)

// Problem: 1901. Find a Peak Element II
execute(
    inputs: [[[1,4],[3,2]]],
    expectedOutputs: [[0, 1]],
    for: findPeakGrid2
)
