module Main where

import System.IO (isEOF)
import Data.List (sort)

-- Get the input from STDIN line-wise
getInput :: IO [String]
getInput = do
    done <- isEOF
    if done
    then return []
    else do
        line <- getLine
        moreLines <- getInput
        return (line:moreLines)

-- Print a list of array to STDOUT
printOutput :: [String] -> IO ()
printOutput [] = error "Unable to print emtpy list"
printOutput [x] = putStrLn x
printOutput (x:xs) = do
    putStrLn x
    printOutput xs

main :: IO ()
main = do
    input <- getInput
    printOutput (sort input)
