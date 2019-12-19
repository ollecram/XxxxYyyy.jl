# XxxxYyyy.jl
Template Julia Package 
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://ollecram.github.io/XxxxYyyy.jl/stable)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://ollecram.github.io/XxxxYyyy.jl/dev)


## Developers Strategy Memo

### JULIA_PKG_DEVDIR
Define a stable path for a folder to hold all julia packages in development. 
- Set the variable `JULIA_PKG_DEVDIR` in `.bashrc`
- Create all local clones of Git repositories under `$JULIA_PKG_DEVDIR`
- Suggested choice: `~/devwork/repos/git`

### Use native Git commands to manage cloning, commit, push, etc...
- `$ cd JULIA_PKG_DEVDIR`
- `$ git clone git@github.com:ollecram/XxxxYyyy.jl.git`


### Drop the `.jl` suffix from the local clone of a Julia package repository 
- `$ mv XxxxYyyy.jl  XxxxYyyy`

### Refer to cloned packages by their local path (vs the GitHub repository path)
- `$ cd JULIA_PKG_DEVDIR`
- `$ julia`
- `julia> ]`
- `(1.3) pkg> activate XxxxYyyy`
- `(XxxxYyyy) pkg> develop XxxxYyyy`
- `(XxxxYyyy) pkg> status`
- `(XxxxYyyy) pkg> status --manifest`

### Running tests
In order to have coverage measured as part of the test the julia REPL should be started with the following options        

`--code-coverage=tracefile-%p.info --code-coverage=user`

#### A typical test session 
- `cd $JULIA_PKG_DEVDIR`
- `julia --code-coverage=tracefile-%p.info --code-coverage=user`
- `]`
- `(1.3) pkg> activate XxxxYyyy`
- `(XxxxYyyy) pkg> test --coverage`

#### Manually building the documentation 
- `(XxxxYyyy) pkg> activate XxxxYyyy/docs`
- `julia> include("XxxxYyyy/docs/make.jl")`

The generated docs can be found at XxxxYyyy/docs/build.

### Automated build and publishing of the documentation
The file `build-and-deploy-docs.yml` under `.github/workflows/` defines the job to be triggered by a `push` on the GitHub repo (master).

