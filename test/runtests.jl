using Code2String
using Test

@testset "Code2String.jl" begin
    # top level folder  
    top_folder = "test_folder"
    # an optional function for filtering. return true to keep
    keep(r, d, f; valid_format) = extension_matches(f, valid_format)
    # valid formats to keep 
    valid_format = ["txt", ".qm"]
    str = code2string(top_folder; keep, valid_format)
    @test str == "file1.qmfile2.qmfile3.txt"
end

@testset "extension_matches" begin
    file = "test_folder/file.jl"
    @test extension_matches(file, ".jl")
    @test extension_matches(file, "jl")
    @test !extension_matches(file, ".txt")
    @test !extension_matches(file, "txt")

    @test extension_matches(file, ["txt", "jl"])
    @test extension_matches(file, [".txt", ".jl"])
    @test !extension_matches(file, ["txt", "exe"])
    @test !extension_matches(file, [".txt", ".exe"])
end
