using Documenter, XxxxYyyy

makedocs(;
    modules=[XxxxYyyy],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/ollecram/XxxxYyyy.jl/blob/{commit}{path}#L{line}",
    sitename="XxxxYyyy.jl",
    authors="Marcello Vitaletti",
    assets=String[],
)
