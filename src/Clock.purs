module Clock where

import Counter.Core (inc)
import Effect (Effect)
import Prelude

start :: (Int -> Effect Unit) -> Effect Unit
start = flip run 0

run :: (Int -> Effect Unit) -> Int -> Effect Unit
run f count = do
  f count
  sleep 1000
  run f (inc count)


foreign import sleep :: Int -> Effect Unit

tick :: Int -> Effect Unit
tick int = sleep $ 1000 * int
