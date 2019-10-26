module Clock where

import Counter.Core (inc)
import Effect (Effect)
import Prelude

start :: (Int -> Effect Unit) -> Effect Unit
start = run 0


{--
  NOTE: This is Pipeline style like we do with OK.Pipe
  Only it's for the `Effect` monad instead of the `Result.t()`
  or `{:ok, val} | {:error, msg}` tuples
--}
{-- run :: Int -> (Int -> Effect Unit) -> Effect Unit --}
{-- run count f = --}
{--   f count --}
{--   *> sleep 1000 --}
{--   *> run (inc count) f --}

run :: Int -> (Int -> Effect Unit) -> Effect Unit
run count f = do
  _ <- f count
  _ <- sleep 1000
  run (inc count) f


foreign import sleep :: Int -> Effect Unit
