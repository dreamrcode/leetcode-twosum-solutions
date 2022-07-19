/*
 LeetCode Link: https://leetcode.com/problems/two-sum/
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 You can return the answer in any order.
 
 Example 1:
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 
 Example 2:
 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 
 Example 3:
 Input: nums = [3,3], target = 6
 Output: [0,1]
  
 Constraints:
 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 Only one valid answer exists.

 Follow-up: Can you come up with an algorithm that is less than O(n^2) time complexity?
 
 */

import UIKit

class Solution {
    
    // brute force solution
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        // if parameters are not within constraints
        if !isWithinConstraints(arrayCount: nums.count, target: target) {
            return [Int]()
        }
        
        // for each index in nums
        for i in 0..<nums.count {
            
            // for each index in nums
            for i2 in 0..<nums.count {
                
                // check if it is not the same index
                if i != i2 {
                    
                    // if the sum of both elements is the same as the target, return the two indexes.
                    if nums[i] + nums[i2] == target {
                        return [i, i2]
                    }
                }
            }
        }
        
        return [Int]()
    }
    
    // hash map solution
    func betterTwoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        // if parameters are not within constraints
        if !isWithinConstraints(arrayCount: nums.count, target: target) {
            return [Int]()
        }
        
        // declare a dictionary to store a number as a key, with the index as the value.
        var dictionary = [Int: Int]()
        
        // for every element
        for (i, num) in nums.enumerated() {
            
            // if the dictionary has the number that is equals to the target minus num, return the last index and current index.
            if let lastIndex = dictionary[target - num] {
                return [lastIndex, i]
            }
            dictionary[num] = i
        }
        
        return [Int]()
    }
    
    private func isWithinConstraints(arrayCount: Int, target: Int) -> Bool {
        return arrayCount >= 2 && arrayCount <= 104 && target >= -109 && target <= 109
    }
}

// Test Solutions
var solution = Solution()
solution.twoSum([2,7,11,15], 9)
solution.twoSum([3,2,4], 6)
solution.twoSum([3,3], 6)
solution.betterTwoSum([2,7,11,15], 9)
solution.betterTwoSum([3,2,4], 6)
solution.betterTwoSum([3,3], 6)
