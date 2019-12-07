# XxxxYyyy.jl
Template Julia Package 
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://ollecram.github.io/VlpRng.jl/stable)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://ollecram.github.io/VlpRng.jl/dev)


## Developers Strategy Memo

### JULIA_PKG_DEVDIR
Define a stable path for a folder to hold all julia packages in development. 
- Set the variable `JULIA_PKG_DEVDIR` in `.bashrc`
- Create all local clones of Git repositories under `$JULIA_PKG_DEVDIR`
- Suggested choice: `~/devwork/repos/git`

### Keep a dedicated environment within the GitHub repo of each Julia package
- Package name: `XxxxYyyy` &ndash; GitHub repo name: `XxxxYyyy.jl`
- Folder `XxxxYyyy.jl`  **must be renamed**  `XxxxYyyy`  IMMEDIATELY AFTER a clone command
- Folder `XxxxYyyy/prjenv` holds the environment (NOT to be declared in `.gitignore`)

### Use native Git commands to manage cloning, commit, push, etc...
- `$ cd JULIA_PKG_DEVDIR`
- `$ git clone git@github.com:ollecram/XxxxYyyy.jl.git`
- `$ mv XxxxYyyy.jl  XxxxYyyy`

### Refer to cloned packages by their local path (vs the GitHub repository path)
- `$ cd JULIA_PKG_DEVDIR`
- `$ julia`
- `julia> ]`
- `(1.3) pkg> activate XxxxYyyy/prjenv`
- `(prjenv) pkg> develop XxxxYyyy`
- `(prjenv) pkg> status --manifest`

### Running tests
In order to have coverage measured as part of the test the julia REPL should be started with the following options        

`--code-coverage=tracefile-%p.info --code-coverage=user`

In summary, the following commands illustrate a typical development session 
- `cd $JULIA_PKG_DEVDIR`
- `julia --code-coverage=tracefile-%p.info --code-coverage=user`
- ]
- `(1.3) pkg> test --coverage XxxxYyyy`
- Exit from the Pkg session and terminate the REPL in order to manually build the documentation
- `cd XxxxYyyy/docs`
- `julia --color=yes make.jl`

### Automated build and publishing of the documentation
The file `build-and-deploy-docs.yml` under `.github/workflows/` defines the job to be triggered by `push` on the GitHub repo.

The generated docs can be found at XxxxYyyy/docs/build.
