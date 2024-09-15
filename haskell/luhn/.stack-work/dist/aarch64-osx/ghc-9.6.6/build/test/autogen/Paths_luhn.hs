{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_luhn (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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
version = Version [1,7,0,7] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/yutatsu/Exercism/haskell/luhn/.stack-work/install/aarch64-osx/b1d5c9089de3d767856edd1d146d256d191f9f207352fc805311288db6566e62/9.6.6/bin"
libdir     = "/Users/yutatsu/Exercism/haskell/luhn/.stack-work/install/aarch64-osx/b1d5c9089de3d767856edd1d146d256d191f9f207352fc805311288db6566e62/9.6.6/lib/aarch64-osx-ghc-9.6.6/luhn-1.7.0.7-G2jNvX5rz03K7r50QR3Gl5-test"
dynlibdir  = "/Users/yutatsu/Exercism/haskell/luhn/.stack-work/install/aarch64-osx/b1d5c9089de3d767856edd1d146d256d191f9f207352fc805311288db6566e62/9.6.6/lib/aarch64-osx-ghc-9.6.6"
datadir    = "/Users/yutatsu/Exercism/haskell/luhn/.stack-work/install/aarch64-osx/b1d5c9089de3d767856edd1d146d256d191f9f207352fc805311288db6566e62/9.6.6/share/aarch64-osx-ghc-9.6.6/luhn-1.7.0.7"
libexecdir = "/Users/yutatsu/Exercism/haskell/luhn/.stack-work/install/aarch64-osx/b1d5c9089de3d767856edd1d146d256d191f9f207352fc805311288db6566e62/9.6.6/libexec/aarch64-osx-ghc-9.6.6/luhn-1.7.0.7"
sysconfdir = "/Users/yutatsu/Exercism/haskell/luhn/.stack-work/install/aarch64-osx/b1d5c9089de3d767856edd1d146d256d191f9f207352fc805311288db6566e62/9.6.6/etc"

getBinDir     = catchIO (getEnv "luhn_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "luhn_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "luhn_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "luhn_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "luhn_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "luhn_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
