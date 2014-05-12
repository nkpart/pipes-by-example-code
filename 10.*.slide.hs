{-# LANGUAGE DeriveDataTypeable #-}-- {{{
{-# LANGUAGE GeneralizedNewtypeDeriving #-}-- }}}
module ForLoops3 where

import Data.Generics-- {{{
import Pipes as P
import Pipes.Prelude as P
import Data.Binary
import Control.Distributed.Process

newtype Terminate a = Terminate a deriving (Typeable, Binary)-- }}}

runWorkOnSlaves :: (Typeable a, Binary a) 
                => Producer a Process ()  -- Our work queue
                -> Producer ProcessId Process ()  -- Our slave queue
                -> Effect Process ()
runWorkOnSlaves workPipe slavePipe = do
  let workAndSlave = P.zip workPipe slavePipe
  P.for workAndSlave $ \(work, them) -> P.lift $ send them work
  P.for slavePipe $ \them -> P.lift $ send them (Terminate ())

-- > main = do-- {{{
-- >   profile "Industrial"-- }}}
