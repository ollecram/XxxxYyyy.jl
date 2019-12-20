# Julia Package Development Strategy

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
		

1. Configure some Git global variables and set JULIA_PKG_DEVDIR variable

	- `user.name` (e.g. Marcello Vitaletti)
    	- `git config --global user.name "Marcello Vitaletti"`
	
    - `user.email` (e.g. marcello.vitaletti@gmail.com)
	    - `git config --global user.email "marcello.vitaletti@gmail.com"`
  
    - `github.user` (e.g. ollecram)
    	- `git config --global github.user "ollecram"`

	- Edit `.bashrc` to set `JULIA_PKG_DEVDIR` to a stable path for a folder holding all julia packages in development
    	- Example: 
		    > $ cat ~/.bashrc | grep JULIA_PKG_DEVDIR
			> export JULIA_PKG_DEVDIR=~/devwork/repos/git

