module NewtonsMethod

using InstantiateFromURL
activate_github("QuantEcon/QuantEconLecturePackages", tag = "v0.9.0") # activate the QuantEcon environment

using ForwardDiff

#Newton Method:
function newtonroot(f, f_prime; x_0, tol = 1E-7, maxiter = 1000r)
        @assert f_prime != 0
        x = x_0
        error = Inf
        iter = 1
        while iter < max_iter && error > tol
            error = abs(- (f(x)/f_prime(x)))
            x = x - (f(x)/f_prime(x))
            iter = iter + 1
        end
  
  error-----------------------------------
  
if iter == maxiter+1
        return (root = nothing, normdiff = nothing, iter = nothing)
    else
        return (root = x_old, normdiff = normdiff, iter = iter)
    end
end
-------------------------------------------
(x,iter)
end

# Applying auto-differentiation
D(f) = x -> ForwardDiff.derivative(f, x)

# Using multiple dispatch
newtonroot(f; x₀, tol = 1E-7, maxiter = 1000) = newtonroot(f, D(f), x₀=x₀, tol = tol, maxiter = maxiter)

# Exporting the function
export newtonroot

end # module


end # module


