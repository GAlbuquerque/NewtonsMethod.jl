using NewtonsMethod
using Test

using LinearAlgebra, Statistics, Compat, ForwardDiff

@testset "NewtonsMethod.jl" begin

f1(x) = x^2+1 #This function has no root, it should return nothing
f1_prime(x) = 2*x 
  
@test newtonroot(f1, f1_prime,x₀ = 0).root == nothing
@test newtonroot(f1, x₀ = 0).root == nothing
 
 
#Now, I will test some functions which I know the roots  
f2(x) = (x - 1)^3
f2_prime(x) = 3*((x-1)^2)
  
  
  
@test newtonroot(f2, f2_prime,x₀ = 0).root ≈ 0.9999998643434097

end
