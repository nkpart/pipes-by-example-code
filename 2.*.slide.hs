module MotivateLogging where
import PipesTalk
import Sandwiches

pickSlow xs = pause >> pick xs
  
-- pick' = lift . pick
pick' = lift . pickSlow

makeSandwich = do
    meat <- pick' meats <* tell ["Got a meat"]
    cheese <- pick' cheeses <* tell ["Got a cheese"]
    bread <- pick' breads <* tell ["Got a bread"]
    return (meat, cheese, bread)

main = do
    (sandwich, log) <- runWriterT makeSandwich
    mapM_ putStrLn log
    print sandwich

-- > main = do-- {{{
-- >   profile "Industrial"-- }}}
