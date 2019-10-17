#!/usr/bin/env julia
using ArgParse
using DataIndexing

s = ArgParseSettings()
@add_arg_table s begin
    "rootdir"
        help = "root dir"
        arg_type = String
        required = true
end
args = parse_args(s)

ROOTDIR = args["rootdir"]

dataindex(ROOTDIR)

println("zz, have a nice day!")
