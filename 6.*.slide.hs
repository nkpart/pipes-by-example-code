{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
module Composition where

import System.Random
import Control.Monad
import Pipes as P
import Pipes.Prelude as P

compose :: Monad m	 
        => Pipe a b m r	 
        -> Pipe b c m r
        -> Pipe a c m r 

compose = (>->)

-- compose :: Monad m	 
--         => Producer b m r	 
--         -> Pipe b c m r
--         -> Producer c m r 

-- compose :: Monad m	 
--         => Producer a m r 
--         -> Consumer a m r 
--         -> Effect m r

rands :: Producer Float IO ()
rands = forever $ do
          r <- lift (randomRIO (0, 1.0))
          yield r

someRands :: Producer Float IO ()
someRands = rands >-> P.take 50 >-> P.drop 10 >-> P.filter (> 0.1)

