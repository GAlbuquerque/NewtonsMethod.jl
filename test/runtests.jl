using NewtonsMethod
using Test

using LinearAlgebra, Statistics, Compat, ForwardDiff

@testset "NewtonsMethod.jl" begin

f1(x) = (x - 1)^3
f1_prime(x) = 3*((x-1)^2)
@test newtonroot(f1, f1_prime).root ≈ 0.9999998643434097

end
