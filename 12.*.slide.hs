module CodeDone where

import PipesTalk
import Sandwiches
import Pipes
import Pipes.Prelude as P hiding (print)

pick' xs = lift (pick xs)

makeSandwich = forever $ do
    meat <- pick' meats
    cheese <- pick' cheeses
    bread <- pick' breads
    yield (meat, cheese, bread)

main = runEffect (for salmonSandwiches (lift . print))
  where salmonSandwiches = makeSandwich >-> P.filter isSalmon >-> P.take 8
        isSalmon (m,_,_) = m == "smoked salmon"

-- > main = do-- {{{
-- >   profile "Industrial"-- }}}
-- No More Code
