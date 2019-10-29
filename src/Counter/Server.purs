module Counter.Server where

{-- import Control.Lazy (fix) --}
import Counter.Core (Msg(..), inc)
import Effect (Effect)
import Erl.Process.Raw (receive, send)
import Prelude


{-- run :: Int -> Effect Unit --}
{-- run n = listen n --}

{--
  LambdaCase-style syntax
  instead of the more verbose
  ```
  listen count = do
      a <- receive
      case a of
          ...
--}
-- Curious how to use recursion schemes to factor this run call...

run :: Int -> Effect Unit
run count = run =<< do
  (receive :: Effect Msg) >>= case _ of
    Tick -> do
        pure $ inc count

    State pid -> do
        send pid count
        pure count
