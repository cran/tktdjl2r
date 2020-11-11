# tktdjl2r


`tktdjl2r` is a `R` companion package for `TKTDsimulation.jl` package written in `julia`
to simulate *TKTD* models.


You will need a working installation of Julia in your path.
To install Julia, download a generic binary from the JuliaLang site and add it to your path.

`TKTDsimulation.jl` utilizes differential equation package of
[DifferentialEquations.jl](https://diffeq.sciml.ai/dev/).

# Install julia and require packages

Once `julia` is installed, you may have to install `TKTDsimulation.jl` since this
package is not in the official repository.


```julia
(@v1.5) pkg> add https://github.com/virgile-baudrot/TKTDsimulation.jl
   Updating git-repo `https://github.com/virgile-baudrot/TKTDsimulation.jl`
   Updating registry at `C:\Users\NAME\.julia\registries\General`
 Resolving package versions...
No Changes to `C:\Users\NAME\.julia\environments\v1.5\Project.toml`
No Changes to `C:\Users\NAME\.julia\environments\v1.5\Manifest.toml`
```


To install the master branch of the package (for developers), use:

```
devtools::install_github('in2p3/sandrine.charles/tktdjl2r', build_vignettes=T)
```

# Trouble with JuliaCall

See the [JuliaCall github repository](https://github.com/Non-Contradiction/JuliaCall)

## Test `JuliaCall`:

```
library(JuliaCall)
julia <- julia_setup()
```

Then try this comand:

```
julia_command("a = sqrt(2);")
julia_eval("a")
```

# A simple example

```
library(tktdjl2r)

# Julia can be quite long to install the first time.
tktdjl2r::tktdjl2r_setup()
```

You should see these lines on windows:

```
Julia version 1.5.0 at location C:\Users\NAME\AppData\Local\Programs\JULIA1~1.0\bin will be used.
Loading setup script for JuliaCall...
Finish loading setup script for JuliaCall.
```

Then run the following models:

Note: the first time a model is run, it can be quite long due to setup.

* TK model:
```
single_runTK = runTK(time=c(0,1,2,3), conc=c(0,1,2,2), kd=0.5)

```

* SD model:
```
single_runSD = runSD(time=c(0,1,2,3), conc=c(0,1,2,2), 
                     kd=0.5, hb=0.2, z=1, kk=0.4)
```

* IT model
```
single_runIT = runIT(time=c(0,1,2,3), conc=c(0,1,2,2),
                     kd=0.5, hb=0.2, alpha=1, beta=0.4)
```
