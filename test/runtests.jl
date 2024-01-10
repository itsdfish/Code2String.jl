using Code2String
using Test

@testset "Code2String.jl" begin
    # top level folder  
    top_folder = "test_folder"
    # an optional function for filtering. return true to keep
    keep(r, d, f; valid_format) = any(x -> contains(f, x), valid_format)
    # valid formats to keep 
    valid_format = ["txt",".jl"]
    str = code2string(top_folder; keep, valid_format)
    @test str == "file1.jlfile2.jlfile3.txt"
end
