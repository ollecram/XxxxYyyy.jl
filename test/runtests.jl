using XxxxYyyy
using Test
using Documenter

@testset "XxxxYyyy.jl" begin

    @test hello("Julia") == "Hello, Julia"
    @test domath(2.0) ≈ 7.0

    # Documenter test of module documentation
    doctest(XxxxYyyy; manual=false)
    
end
