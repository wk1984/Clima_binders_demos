FROM quay.io/jupyter/julia-notebook

# install julia pkgs ===========
RUN echo 'using Pkg; Pkg.add("ClimaLand")' | julia
RUN echo 'using Pkg; Pkg.precompile()' | julia
RUN echo 'using Pkg; Pkg.build("PyCall")' | julia
RUN echo 'using Pkg; Pkg.gc()' | julia

WORKDIR /work