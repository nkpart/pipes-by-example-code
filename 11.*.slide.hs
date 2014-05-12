module RedoneInitial where

import PipesTalk
import Sandwiches
import Pipes

pick' xs = lift $ do
    pause 
    pick xs

makeSandwich = do
    -- meat <- pick' meats <* tell ["Got a meat"]
    meat <- pick' meats <* yield "Got a meat"
    cheese <- pick' cheeses <* yield "Got a cheese"
    bread <- pick' breads <* yield "Got a bread"
    return (meat, cheese, bread)

main = do
    sandwich <- runEffect (for makeSandwich (lift . putStrLn))
    print sandwich


-- > main = do-- {{{
-- >   profile "Industrial"-- }}}
