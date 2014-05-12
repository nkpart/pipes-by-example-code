module ForLoops2 where

import System.Random-- {{{
import Control.Monad
import PipesTalk
import Pipes-- }}}

rands :: Producer Float IO ()
rands = forever $ do
          r <- lift (randomRIO (0, 1.0))
          lift pause
          yield r

-- main = runEffect (for rands (lift . print))

randsTwice :: Producer Float IO ()
randsTwice = for rands doTwice
  where doTwice v = do
          yield v
          yield v

main = runEffect (for randsTwice (lift . print))

-- > main = do-- {{{
-- >   profile "Industrial"-- }}}
