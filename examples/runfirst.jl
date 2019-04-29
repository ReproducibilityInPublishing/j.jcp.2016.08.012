ENV["PYTHON"]="/usr/bin/python"
if isdir(Pkg.dir("PyPlot"))==false
  Pkg.clone("https://github.com/ReproducibilityInPublishing/PyPlot.jl", "PyPlot")
end
if isdir(Pkg.dir("jInv"))==false
  Pkg.clone("https://github.com/ReproducibilityInPublishing/jInv.jl","jInv")
end
if isdir(Pkg.dir("FactoredEikonalFastMarching"))==false
  Pkg.clone(pwd(),"FactoredEikonalFastMarching")
end
#Pkg.test("FactoredEikonalFastMarching")
