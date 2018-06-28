ENV["PYTHON"]="/usr/bin/python"
if Pkg.installed("PyPlot")==nothing
  Pkg.clone("PyPlot")
end
if isdir(Pkg.dir("jInv"))==false
  Pkg.clone("https://github.com/JuliaInv/jInv.jl","jInv")
end
if isdir(Pkg.dir("FactoredEikonalFastMarching"))==false
  Pkg.clone("https://github.com/JuliaInv/FactoredEikonalFastMarching.jl","FactoredEikonalFastMarching")
end
#Pkg.test("FactoredEikonalFastMarching")
