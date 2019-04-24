ENV["PYTHON"]="/usr/bin/python"
println("Satisfying PyPlot")
if isdir(Pkg.dir("PyPlot"))==false
  Pkg.clone("https://github.com/ReproducibilityInPublishing/PyPlot.jl", "PyPlot")
end
println("Satisfying jInv")
if isdir(Pkg.dir("jInv"))==false
  Pkg.clone("https://github.com/ReproducibilityInPublishing/jInv.jl","jInv")
end
println("Finished.")
#if isdir(Pkg.dir("FactoredEikonalFastMarching"))==false
#  Pkg.clone("https://github.com/JuliaInv/FactoredEikonalFastMarching.jl","FactoredEikonalFastMarching")
#end
#Pkg.test("FactoredEikonalFastMarching")
