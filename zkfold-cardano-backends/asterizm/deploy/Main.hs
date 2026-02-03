module Main where

import           Prelude
import           System.Directory              (createDirectoryIfMissing, getCurrentDirectory)
import           System.FilePath               (takeFileName, (</>))

import           ZkFold.Cardano.OffChain.Utils (savePlutus)
import           ZkFold.Cardano.UPLC.Asterizm  (asterizmRelayerUnparameterized)

main :: IO ()
main = do
  currentDir <- getCurrentDirectory
  let path = case takeFileName currentDir of
        "assets" -> ".."
        _        -> "."

  createDirectoryIfMissing True $ path </> "assets"

  savePlutus (path </> "assets" </> "asterizmRelayerUnparameterized.plutus") asterizmRelayerUnparameterized

