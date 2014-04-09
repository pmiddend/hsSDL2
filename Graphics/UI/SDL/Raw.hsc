-----------------------------------------------------------------------------
-- |
-- Module      :  Graphics.UI.SDL.Raw
-- 
-- The module "Graphics.UI.SDL.Raw" provides an interface to functions
-- needed by extension libraries that depend on SDL2.
-- 
-- These functions should only be used internally or by dependant libraries.
-----------------------------------------------------------------------------

#include "SDL.h"
module Graphics.UI.SDL.Raw
  ( mkFinalizedSurface
  ) where

import Foreign
import Graphics.UI.SDL.Types

foreign import ccall unsafe "&SDL_FreeSurface"
  sdlFreeSurface_finalizer' :: FunPtr (Ptr SurfaceStruct -> IO ())

mkFinalizedSurface :: Ptr SurfaceStruct -> IO Surface
mkFinalizedSurface = newForeignPtr sdlFreeSurface_finalizer'

