using NewtonsMethod
using Test

using LinearAlgebra, Statistics, Compat, ForwardDiff

@testset "NewtonsMethod.jl" begin

#This function has no root, it should return nothing  
f1(x) = x^2+1 
f1_prime(x) = 2*x 
  
@test newtonroot(f1, f1_prime,x₀ = 0).root == nothing
@test newtonroot(f1, x₀ = 0).root == nothing
 
 
#Now, I will test some functions which I know the roots  
f2(x) = (x - 1)^3
f2_prime(x) = 3*((x-1)^2)
  
f3(x) = 4*x+5
f3_prime(x) = 4
  
f4(x) = 5^x - 25  
f4_prime(x) =  5^x * log(5)

  
@test newtonroot(f2, f2_prime,x₀ = 0).root ≈ 0.9999998643434097
@test newtonroot(f2, x₀ = 0).root ≈ 0.9999998643434097

  
@test newtonroot(f3, f3_prime,x₀ = 0).root ≈ -1.25
@test newtonroot(f3, x₀ = 0).root ≈ -1.25

@test newtonroot(f4, f4_prime,x₀ = 0).root ≈ 2
@test newtonroot(f4, x₀ = 0).root ≈ 2

 #Testing tolerance
 @test !(newtonroot(f2, f2_prime, x₀ = 0, tolerance = 1).root ≈ 0.9999998643434097)
 @test !(newtonroot(f2, x₀ = 0, tolerance = 1).root ≈ 0.9999998643434097)
 @test newtonroot(f2, f2_prime, x₀ = 0, tolerance = 1E-10).root ≈ 1 1 #with smaller tolerance, I can reach the "exact" number

  
 #Testing BigFloat
 #@test newtonroot(f2, f2_prime, x₀ = BigFloat(0.0), tolerance = 1E-40).root ≈ 1
 #@test newtonroot(f2, x₀ = BigFloat(0.0), tolerance = 1E-40).root ≈ 1
  
 #Testing if the maxiter works as intended
   #Function 2
  # @test newtonroot(f2, f2_prime, x₀ = 0, maxiter = 10).root == nothing
   #@test newtonroot(f2, x₀ = 0, maxiter = 10).root == nothing
   #Function 4
   #@test newtonroot(f4, f4_prime, x₀ = 0, maxiter = 10).root == nothing
   #@test newtonroot(f4,x₀ = 0, maxiter = 10).root == nothing
   
end
