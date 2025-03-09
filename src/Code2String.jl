module Code2String

export code2string
export extension_matches

"""
    code2string(top_folder; keep = (r,d,f; kwargs...) -> true)

Traverses the directory starting at `top_folder` and concatonates the file contents as a string. 

# Arguments 

- `top_folder`: the path to the top level folder where the traversing begins 

# Keywords 

- `keep`: an optional indictor function specifying which files to keep. The function signature is 
    `f(root, dir, file; kwargs...) -> Bool` 
- `kwargs...`: optional keyword arguments passed to `keep`
"""
function code2string(top_folder; keep = (r, d, f; kwargs...) -> true, kwargs...)
    # collects all strings 
    str = ""
    # traverse the directory
    for (root, dirs, files) in walkdir(top_folder)
        filter!(f -> keep(root, dirs, f; kwargs...), files)
        for file in files
            path = joinpath(root, file)
            file = open(path)
            new_str = read(file, String)
            str *= new_str
            close(file)
        end
    end
    return str
end

"""
    extension_matches(file::String, extension::String)

Tests whether a file extension matches a specified type. 

# Arguments

- `file::String`: a file name or path to a file 
- `extension::String`: the file extension used in the test
"""
function extension_matches(file::String, extension::String)
    # remove . if any exists
    extension = split(extension, ".")[end]
    str = split(file, ".")[2]
    return extension == str
end

"""
    extension_matches(file::String, extension::String)

Tests whether a file extension matches any specified types. 

# Arguments

- `file::String`: a file name or path to a file 
- `extensions::Vector{String}`: a vector of file extensions used in the test
"""
function extension_matches(file::String, extensions::Vector{String})
    return any(x -> extension_matches(file, x), extensions)
end

end
