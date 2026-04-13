FROM quay.io/jupyter/julia-notebook
    
# Make sure the contents of our repo are in ${HOME}
COPY ./*.ipynb /work

# install julia pkgs ===========
RUN echo 'using Pkg; Pkg.add("ClimaLand")' | julia

RUN echo 'using Pkg; Pkg.add("ClimaDiagnostics")' | julia

RUN echo 'using Pkg; Pkg.precompile()' | julia
RUN echo 'using Pkg; Pkg.gc()' | julia

WORKDIR /work