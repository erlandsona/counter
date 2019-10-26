module Counter.Core where

import Erl.Process.Raw (Pid)
import Prelude

newtype Count = Count Int

data Msg
  = Tick
  | State Pid

inc :: Int -> Int
inc = (+) 1
