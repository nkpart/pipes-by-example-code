module Primitives4Channels where

import Control.Monad (forever)-- {{{
import Data.Typeable (Typeable)
import Data.Binary (Binary)
import Pipes
import Control.Distributed.Process-- }}}

receivePipe :: (Typeable a, Binary a) => ReceivePort a -> Producer a Process ()
receivePipe ch = forever $ do
  v <- lift (receiveChan ch)
  yield v

sendPipe :: (Typeable a, Binary a) => SendPort a -> Consumer a Process ()
sendPipe ch = forever $ do
  v <- await
  lift (sendChan ch v)

passThrough :: (Typeable a, Binary a) => ReceivePort a -> SendPort a -> Effect Process ()
passThrough rp sp = receivePipe rp >-> sendPipe sp

