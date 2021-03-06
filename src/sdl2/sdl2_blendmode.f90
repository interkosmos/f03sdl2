! sdl2_blendmode.f90
!
! Fortran 2008 interfaces to SDL_blendmode.h.
!
! Author:  Philipp Engel
! GitHub:  https://github.com/interkosmos/fortran-sdl2/
! Licence: ISC
module sdl2_blendmode
    use, intrinsic :: iso_c_binding, only: c_int
    implicit none

    ! SDL_BlendMode
    integer(kind=c_int), parameter :: SDL_BLENDMODE_NONE    = int(z'00000000')
    integer(kind=c_int), parameter :: SDL_BLENDMODE_BLEND   = int(z'00000001')
    integer(kind=c_int), parameter :: SDL_BLENDMODE_ADD     = int(z'00000002')
    integer(kind=c_int), parameter :: SDL_BLENDMODE_MOD     = int(z'00000004')
    integer(kind=c_int), parameter :: SDL_BLENDMODE_INVALID = int(z'7FFFFFFF')
end module sdl2_blendmode
