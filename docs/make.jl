using Documenter, DataIndexing

makedocs(;
    modules=[DataIndexing],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/lizz/DataIndexing.jl/blob/{commit}{path}#L{line}",
    sitename="DataIndexing.jl",
    authors="lizz",
    assets=String[],
)
