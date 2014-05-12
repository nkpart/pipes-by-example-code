{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PackageImports #-}
module Styles where

import Control.Monad
import System.Process as P
import Data.Text

profile f = void $ runCommand $ "echo -e '\\033]50;SetProfile=" ++ f ++ "\\a'"

transparency :: Float -> IO ()
transparency f = tellTerminal $ "set transparency to " ++ show f

activate = tellTerminal "activate"

tellTerminal f = (waitForProcess =<< runProcess "osascript" ["-e", xs] Nothing Nothing Nothing Nothing Nothing) >> return ()
  where xs = "tell application \"iTerm\" to tell current session of current terminal to " ++ f
