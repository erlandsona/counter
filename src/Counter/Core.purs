module Counter.Core where

import Erl.Process.Raw (Pid)
import Prelude

data Msg
  = Tick
  | State Pid

inc :: Int -> Int
inc = (+) 1
