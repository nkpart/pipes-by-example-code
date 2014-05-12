{-# LANGUAGE NoMonomorphismRestriction #-}
module Thing where

import Pipes

thing :: Monad m => Consumer b m b
thing = do
    v <- await
    return v
