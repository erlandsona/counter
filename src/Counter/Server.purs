module Counter.Server where

import Counter.Core (Msg(..), Count(..), inc)
import Effect (Effect)
import Erl.Process.Raw (receive, send)
import Prelude


run :: Int -> Effect Int
run count = listen count >>= run

{--
  LambdaCase-style syntax
  instead of the more verbose
  ```
  listen count = do
      a <- receive
      case a of
          ...
--}
listen :: Int -> Effect Int
listen count =
  receive >>= case _ of
    Tick -> do
        pure (inc count)

    State pid -> do
        _ <- send pid (Count count)
        pure count
