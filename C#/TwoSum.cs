public class Solution {
    //HashMap Solution
    public int[] TwoSum(int[] nums, int target) {
       int[] sol = new int [2];
       Dictionary<int, int> complements = new Dictionary<int, int>();
       for(int i = 0; i < nums.Length; i++) {
           if(complements.ContainsKey(nums[i])) {
               sol[0] = complements[nums[i]];
               sol[1] = i;
               return (sol);
           }
           complements.Add(target - nums[i], i);
       }
        int[] no =  {0};
        return no;
    }

    //Brute Force Solution
        public int[] BruteForceTwoSum(int[] nums, int target) {
        int i, j;
        int[] sol = new int [2];
        for(i = 0; i < nums.Length; i++){
            for(j = 0; j < nums.Length; j++){
                if (nums[i] + nums[j] == target){
                    sol[0] = i;
                    sol[1] = j;
                    return (sol);
                }    
            }
        }
        int[] no =  {0};
        return no;
    }
}

/*
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

 

Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Output: Because nums[0] + nums[1] == 9, we return [0, 1].

Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]

Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]

*/

