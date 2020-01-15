using Documenter, DataIndexer

makedocs(;
    modules=[DataIndexer],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/lizz/DataIndexer.jl/blob/{commit}{path}#L{line}",
    sitename="DataIndexer.jl",
    authors="lizz",
    assets=String[],
)
