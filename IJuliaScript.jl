#!/usr/bin/env julia

using Pkg
Pkg.add("IJulia")
Pkg.update()
Pkg.build("IJulia")
using IJulia
installkernel("Julia nodeps", "--depwarn=no")
installkernel("Julia (4 threads)", env=Dict("JULIA_NUM_THREADS"=>"4"))