{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_rna_transcription (
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
version = Version [1,3,0,10] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/yutatsu/Exercism/haskell/rna-transcription/.stack-work/install/aarch64-osx/b1d5c9089de3d767856edd1d146d256d191f9f207352fc805311288db6566e62/9.6.6/bin"
libdir     = "/Users/yutatsu/Exercism/haskell/rna-transcription/.stack-work/install/aarch64-osx/b1d5c9089de3d767856edd1d146d256d191f9f207352fc805311288db6566e62/9.6.6/lib/aarch64-osx-ghc-9.6.6/rna-transcription-1.3.0.10-8t3GXcHaHtq7h6laMxD1Dj-test"
dynlibdir  = "/Users/yutatsu/Exercism/haskell/rna-transcription/.stack-work/install/aarch64-osx/b1d5c9089de3d767856edd1d146d256d191f9f207352fc805311288db6566e62/9.6.6/lib/aarch64-osx-ghc-9.6.6"
datadir    = "/Users/yutatsu/Exercism/haskell/rna-transcription/.stack-work/install/aarch64-osx/b1d5c9089de3d767856edd1d146d256d191f9f207352fc805311288db6566e62/9.6.6/share/aarch64-osx-ghc-9.6.6/rna-transcription-1.3.0.10"
libexecdir = "/Users/yutatsu/Exercism/haskell/rna-transcription/.stack-work/install/aarch64-osx/b1d5c9089de3d767856edd1d146d256d191f9f207352fc805311288db6566e62/9.6.6/libexec/aarch64-osx-ghc-9.6.6/rna-transcription-1.3.0.10"
sysconfdir = "/Users/yutatsu/Exercism/haskell/rna-transcription/.stack-work/install/aarch64-osx/b1d5c9089de3d767856edd1d146d256d191f9f207352fc805311288db6566e62/9.6.6/etc"

getBinDir     = catchIO (getEnv "rna_transcription_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "rna_transcription_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "rna_transcription_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "rna_transcription_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "rna_transcription_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "rna_transcription_sysconfdir") (\_ -> return sysconfdir)



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
