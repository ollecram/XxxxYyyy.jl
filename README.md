# XxxxYyyy.jl
Template Julia Package 
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://ollecram.github.io/MyPackage.jl/stable)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://ollecram.github.io/MyPackage.jl/dev)

# Julia Packages Development Strategy

## References 

### Pkg

[P1](https://julialang.github.io/Pkg.jl/v1.3)
[P2](https://github.com/JuliaLang/Example.jl)
[P3](https://github.com/invenia/PkgTemplates.jl/tree/v0.6.3)
[P4](https://github.com/JuliaCI/Coverage.jl)
[P5](https://tlienart.github.io/pub/julia/dev-pkg.html)
[P6](https://www.juliabloggers.com/finalizing-your-julia-package-documentation-testing-coverage-and-publishing/)
[P7](https://docs.julialang.org/en/v1/manual/style-guide/index.html)


### Documenter

[D1](https://juliadocs.github.io/Documenter.jl/stable/)
[D2](https://pages.github.com/)
[D3](https://docs.julialang.org/en/v1/stdlib/Markdown/)


### GitHub actions and self-hosted runners
[G1](https://help.github.com/en/actions/automating-your-workflow-with-github-actions)
[G2](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-the-self-hosted-runner-application-as-a-service)


## Preliminaries

0. Reminder:
	- `]` at the Julia REPL is used to switch from `julia>` to the Pkg command line `pkg>`
	- Backspace (or Ctrl+C) is used to switch back from `pkg>` to `julia>`
    - `;` 		to switch from `julia>` to `shell>`     (automatically switching back)
	- `?` 		to switch from `julia>` to `help?>`     (automatically switching back)
		

1. Configure some Git global variables for your development work

	- `user.name` (e.g. Alan Turing)
    	- `git config --global user.name "Alan Turing"`
	
    - `user.email` (e.g. alan.turing@gmail.com)
	    - `git config --global user.email "alan.turing@gmail.com"`
  
    - `github.user` (e.g. nalagnirut)
    	- `git config --global github.user "nalagnirut"`


## Development routine memo

### JULIA_PKG_DEVDIR
Define a stable path for a folder to hold all julia packages in development. 
- Set the variable `JULIA_PKG_DEVDIR` in `.bashrc`
    - Example: 
	    - $ cat ~/.bashrc | grep JULIA_PKG_DEVDIR
    		- export JULIA_PKG_DEVDIR=~/devwork/repos/git
- Create all local clones of Git repositories under `$JULIA_PKG_DEVDIR`
- Suggested choice: `~/devwork/repos/git`

### Use this project as a template for new Julia packages
Click this [link](#using-this-template-as-a-starter-for-a-new-package) for jumping to an explanation of how this can be actually done.

### Use native Git commands to manage cloning, commit, push, etc...
- `$ cd JULIA_PKG_DEVDIR`
- `$ git clone git@github.com:nalagnirut/MyPackage.jl.git`

### Drop the `.jl` suffix from the local clone of a Julia package repository 
- `$ mv MyPackage.jl  MyPackage`

### Refer to cloned packages by their local path (vs the GitHub repository path)
- `$ cd JULIA_PKG_DEVDIR`
- `$ julia`
- `julia> ]`
- `(1.3) pkg> activate MyPackage`
- `(MyPackage) pkg> develop MyPackage`
- `(MyPackage) pkg> status`

### Running tests
In order to have coverage measured as part of the test the julia REPL should be started with the following options        

`--code-coverage=tracefile-%p.info --code-coverage=user`

#### Typical test session 
- `cd $JULIA_PKG_DEVDIR`
- `julia --code-coverage=tracefile-%p.info --code-coverage=user`
- `]`
- `(1.3) pkg> activate MyPackage`
- `(MyPackage) pkg> test --coverage`

#### Manually building the documentation 
- `(MyPackage) pkg> activate MyPackage/docs`
- `julia> include("MyPackage/docs/make.jl")`

The generated docs will then be found at MyPackage/docs/build.

### Automated build and publishing of the documentation

Configure GitHub actions on your package repository to have documentation automatically
built and published to GitHub Pages.

The file `.github/workflows/build-and-deploy-docs.yml` defines a job triggered by any `push` to the GitHub repository master.

# Using this template as a starter for a new package

In this section `WwwwZzzz` is a substitute for the name of a new Julia package you want to develop. 

1. If you need to create a project in GitHub to hold code for a new package `WwwwZzzz` then you should create a new GitHub repository named `WwwwZzzz.jl` since &ndash; by Julia convention &ndash; the `.jl` suffix must be appendend to the package name to form the repository name. Using the GitHub web interface 
    - specify `WwwwZzzz.jl` as the name of the repo, and
    - specify that you want to use `XxxxYyyy.jl` as a template for the new repo.
2. Generate a unique UUID for the new package in a temporary folder
    - `cd /tmp`
    - `julia`
    - `]`
    - `(1.3) pkg> generate WwwwZzzz`
    - Backspace
    - Ctrl+D
3. Clone the newly create repository in the `JULIA_PKG_DEVDIR` directory
    - `cd $JULIA_PKG_DEVDIR`
    - `git clone` git@github.com:nalagnirut//WwwwZzzz.jl.git
    - `mv WwwwZzzz.jl WwwwZzzz`
    - `cd WwwwZzzz`
4. Run the script `customize.sh` specifying the name of the package
    - `./config.sh WwwwZzzz`
5. Run tests
    - See [typical-session](#typical-test-session)
6. Build docs
    - See [building-docs](#manually-building-the-documentation)
7. Commit changes
    - `git add *`
    - `git commit -m "Template customization complete."`
    - `git push`
8. Enabling GitHub workflow and self-hosted runner
    - Follow instructions in `GitHub_Workflow-and-Runner.howto`
