module TwoSum
    ( twoSum
    ) where

import Data.List
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Maybe

--Brute Force Double Recursion
twoSum :: (Eq a, Eq t, Num t, Num a, Enum a) => [t] -> t -> [a]
twoSum list = twoSumH (zip list [0..])

twoSumH :: (Eq a, Eq t, Num t) => [(t, a)] -> t -> [a]
twoSumH [] _ = []
twoSumH (x:xs) t
    |null (f x xs t) = twoSumH xs t
    |otherwise =  f x xs t

f :: (Eq t, Num t) => (t, b) -> [(t, b)] -> t -> [b]
f h [] _ = []
f (h1, h2) ((x1, x2):xs) t
    |h1 + x1 == t = [h2,x2]
    |otherwise = f (h1, h2) xs t


--Using Map
twoSum' :: (Ord k, Num k, Num b, Enum b) => [k] -> k -> [b]
twoSum' list = twoSumH' Map.empty zlist
    where zlist = zip list [0..]

twoSumH' :: (Ord k, Num k) => Map k b -> [(k, b)] -> k -> [b]
twoSumH' _ [] t = []
twoSumH' m (x:xs) t =
    if Map.member com m
        then [m Map.! com, snd x]
        else twoSumH' m1 xs t
    where   com = t - fst x
            m1 = uncurry Map.insert x m


-- run "test twoSum" or "test twoSum'"
test :: (Eq a1, Show a1, Num t, Num a2, Num a1) => ([a2] -> t -> [a1]) -> IO ()
test f = do
  putStrLn ""
  putStrLn $ if f  []           0 == []      then "OK" else "FAIL! It was " ++ show ( f [] 0 ) ++ " but should be []"
  putStrLn $ if f  [2,7,11,15]  9 == [0,1]   then "OK" else "FAIL! It was " ++  show (f  [2,7,11,15]  9) ++ " but should be " ++ show [0,1]
  putStrLn $ if f  [3,2,4]      6 == [1,2]   then "OK" else "FAIL! It was " ++ show (f  [3,2,4] 6) ++ " but it should be " ++ show [1,2]
  putStrLn $ if f  [3,3]        6 == [0,1]   then "OK" else "FAIL! It was " ++ show (f  [3,3] 6) ++ " but it should be " ++ show [0,1]
  putStrLn ""
  return ()

{-
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

-}