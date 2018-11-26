using Test
using SOFA

@testset "SOFA" begin
    testdir = joinpath(dirname(@__DIR__), "test")
    @testset "sofa" begin
        include(joinpath(testdir, "test_sofa.jl"))
    end
end