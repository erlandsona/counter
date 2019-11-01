module Clock where

import Control.Lazy (fix)
import Counter.Core (inc)
import Effect (Effect)
import Prelude

start :: (Int -> Effect Unit) -> Effect Unit
start = fix run 0

run
  :: (Int -> (Int -> Effect Unit) -> Effect Unit) -- Fix
  -> Int -- Count
  -> (Int -> Effect Unit) -- function taking count
  -> Effect Unit
run fix count f = do
  f count
  sleep 1000
  fix (inc count) f


foreign import sleep :: Int -> Effect Unit

tick :: Int -> Effect Unit
tick int = sleep $ 1000 * int
