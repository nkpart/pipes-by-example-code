module ForLoops where

import Pipes
 
myFor :: Monad m => Producer b m r -> (b -> Effect m ()) -> Effect m r
-- myFor :: Monad m => Producer b m r -> (b -> Producer c m ()) -> Producer c m r
-- myFor :: Monad m => Pipe x b m r -> (b -> Consumer x m ()) -> Consumer x m r
myFor = for

-- > main = do-- {{{
-- >   profile "Industrial"-- }}}
