module Code2String

    export code2string

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
    function code2string(top_folder; keep = (r,d,f; kwargs...) -> true, kwargs...)
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

end
