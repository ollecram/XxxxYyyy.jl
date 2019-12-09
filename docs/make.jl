using Documenter, XxxxYyyy

makedocs(;
    modules=[XxxxYyyy],
    format = Documenter.HTML(
        prettyurls = false
    ),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/ollecram/XxxxYyyy.jl/blob/{commit}{path}#L{line}",
    sitename="XxxxYyyy.jl",
    authors="Marcello Vitaletti",
)


deploydocs(;
    repo="github.com/ollecram/XxxxYyyy.jl",
)

