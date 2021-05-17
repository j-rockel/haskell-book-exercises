{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_addition (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\jrockel\\Repos\\haskell-book-exercises\\Chapter_14\\addition\\.stack-work\\install\\c15a607c\\bin"
libdir     = "C:\\Users\\jrockel\\Repos\\haskell-book-exercises\\Chapter_14\\addition\\.stack-work\\install\\c15a607c\\lib\\x86_64-windows-ghc-8.10.4\\addition-0.1.0.0-K2iWZ6nQnziGs0PvcKD5uo"
dynlibdir  = "C:\\Users\\jrockel\\Repos\\haskell-book-exercises\\Chapter_14\\addition\\.stack-work\\install\\c15a607c\\lib\\x86_64-windows-ghc-8.10.4"
datadir    = "C:\\Users\\jrockel\\Repos\\haskell-book-exercises\\Chapter_14\\addition\\.stack-work\\install\\c15a607c\\share\\x86_64-windows-ghc-8.10.4\\addition-0.1.0.0"
libexecdir = "C:\\Users\\jrockel\\Repos\\haskell-book-exercises\\Chapter_14\\addition\\.stack-work\\install\\c15a607c\\libexec\\x86_64-windows-ghc-8.10.4\\addition-0.1.0.0"
sysconfdir = "C:\\Users\\jrockel\\Repos\\haskell-book-exercises\\Chapter_14\\addition\\.stack-work\\install\\c15a607c\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "addition_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "addition_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "addition_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "addition_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "addition_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "addition_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
