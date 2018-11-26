module SOFA
__precompile__(true)

if isfile(joinpath(dirname(@__FILE__),"..","deps","deps.jl"))
    include("../deps/deps.jl")
else
    error("libsofa_c not properly installed. Please run Pkg.build(\"SatelliteScheduling\")")
end

#########################
# Additional Structures #
#########################

export iauASTROM
"""
Star-independent astrometry parameters

Note:
    - Vectors eb, eh, em and v are all with respect to BCRS axes.
"""
struct iauASTROM
    pmt::Float64                        # PM time interval (SSB, Julian years)
    eb::NTuple{3, Float64}            # SSB to observer (vector, au)
    eh::NTuple{3, Float64}            # Sun to observer (unit vector)
    em::Float64                         # distance from Sun to observer (au)
    v::NTuple{3, Float64}             # barycentric observer velocity (vector, c)
    bm1::Float64                        # sqrt(1-|v|^2): reciprocal of Lorenz factor
    bpn::NTuple{3, NTuple{3, Float64}}  # bias-precession-nutation matrix
    along::Float64                      # longitude + s' + dERA(DUT) (radians)
    phi::Float64                        # geodetic latitude (radians)
    xpl::Float64                        # polar motion xp wrt local meridian (radians)
    ypl::Float64                        # polar motion yp wrt local meridian (radians)
    sphi::Float64                       # sine of geodetic latitude
    cphi::Float64                       # cosine of geodetic latitude
    diurab::Float64                     # magnitude of diurnal aberration vector
    eral::Float64                       # "local" Earth rotation angle (radians)
    refa::Float64                       # refraction constant A (radians)
    refb::Float64                       # refraction constant B (radians)

    function iauASTROM(;pmt::Real=0.0,
               em::Real=0.0,
               bm1::Real=0.0,
               along::Real=0.0,
               phi::Real=0.0,
               xpl::Real=0.0,
               ypl::Real=0.0,
               sphi::Real=0.0,
               cphi::Real=0.0,
               diurab::Real=0.0,
               eral::Real=0.0,
               refa::Real=0.0,
               refb::Real=0.0)
    
        new(convert(Float64, pmt), 
            (0.0, 0.0, 0.0),
            (0.0, 0.0, 0.0),
            convert(Float64, em), 
            (0.0, 0.0, 0.0),
            convert(Float64, bm1),
            ((0.0, 0.0, 0.0),(0.0, 0.0, 0.0),(0.0, 0.0, 0.0)),
            convert(Float64, along),
            convert(Float64, phi),
            convert(Float64, xpl),
            convert(Float64, ypl),
            convert(Float64, sphi),
            convert(Float64, cphi),
            convert(Float64, diurab),
            convert(Float64, eral),
            convert(Float64, refa),
            convert(Float64, refb),
            )
    end
end

export iauLDBODY
"""
Body parameters for light deflection
"""
struct iauLDBODY
    bm::Float64                         # mass of the body (solar masses)
    dl::Float64                         # deflection limiter (radians^2/2)
    bpn::NTuple{2, NTuple{3, Float64}}  # barycentric PV of the body (au, au/day)
end

####################
# Include Wrappers #
####################

include("a2af.jl")
include("a2tf.jl")
include("ab.jl")
include("ae2hd.jl")
include("af2a.jl")
include("anp.jl")
include("anpm.jl")
include("apcg.jl")
include("apcg13.jl")
include("apci.jl")
include("apci13.jl")
include("apco.jl")
include("apco13.jl")
include("apcs.jl")
include("apcs13.jl")
include("aper.jl")
include("aper13.jl")

end # module SOFA
