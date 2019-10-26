
module Proc (self) where

import Effect (Effect)
import Erl.Process.Raw (Pid)

self :: Effect Pid
self = self_

foreign import self_ :: Effect Pid
