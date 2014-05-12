{-# LANGUAGE PackageImports #-}
module PipesTalk (
                   module Control.Monad
                 , module System.Random
                 , module Control.Monad.Writer
                 , module Control.Applicative
                 , pause
                 , pick
                 ) where

import Control.Applicative
import Control.Monad
import System.Random
import "mtl" Control.Monad.Writer

pick :: [a] -> IO a
pick xs = (xs !!) `fmap` randomRIO (0, Prelude.length xs - 1)

pause :: IO ()
pause = putStrLn "<hit enter>" >> void getLine

