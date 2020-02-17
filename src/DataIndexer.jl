module DataIndexer

export dataindex

STOPS_START = [".", "_", "-", "id_", "label ", "sdk_", "gcc-", "git-", "glew-", "bullet3-"]
STOPS_FULL = ["__pycache__", "node_modules", "site-packages", "bower_components", "src", "include", "runs", "man3",
    "lib", "bin", "doc", "docs", "build", "terminfo", "debug", "tool", "tools", "gcc", "op", "ops", "env", "envs",
    "3rdparty", "crops", "experiment", "experiments", "install", "json", "mmcv", "mmdet", "openssl", "dep", "blender",
    "pkg", "pkgs", "deps", "gentoo", "awscli", "intel", "software", "softwares", "gmake", "dependencies", "playground",
    "scripts"]
STOPS_IN = ["linux", "finetune", "ffmpeg", "baseline", "inception", "opencv", "snapshots", "ccache", "epoch", "intel64",
    "caffe", "conda", "tensorrt", "cuda", "cudnn", "x86_64", "cmake", "tfevents", "egg-info", "backup", "_recovery_",
    "torch", "tensorflow", "python", "matlab", "tfrecords", "openmpi", "julia/stdlib/v"]
STOPS_END = ["frame", "frames", "model", "models", "config", "configs", "module", "modules", "checkpoint", "checkpoints",
    "log", "logs", "result", "results", "workdir", "workdirs", "work_dir", "work_dirs", "snapshot", "snapshots", "cache",
    "cached"]
SKIP_START = [".", "train-", "validation-"]
SKIP_FULL = ["label", "label~", "_SUCCESS", "checkpoint"]
SKIP_IN = ["tfevents", "model.ckpt", "model.pth", ".ckpt.", ".txt."]
PASS_EXT = [".jpg", ".png", ".avi", ".jpeg", ".mkv", ".py", ".webm", ".pth.tar", ".pth", ".tif", ".tiff", ".mp4", ".mp3",
    ".bmp", ".npy", ".gif", ".txt", ".mdb", ".flv", ".json", ".json5", ".yuv", ".h264", ".list", ".sh", ".md", ".whl",
    ".egg", ".conf", ".yaml", ".rviz", ".launch", ".xml", ".ipynb", ".c", ".cpp", ".h", ".cu", ".tsv", ".o", ".iso",
    ".pub", ".zsh", ".bash", ".yml", ".pickle", ".meta", ".pkl", ".ply", ".bin", ".eps", ".gp", ".skv", ".mat", ".cuh",
    ".key", ".csv", ".proto", ".pcap", ".timestamps", ".m", ".nrrd", ".bak", ".pyc", ".hpp", ".pk", ".mov", ".svs",
    ".prototxt", "xlsx", ".lua", ".a", ".odgt", ".log", ".pyx", ".lock", ".rb", ".html", ".ini", ".caffemodel", ".dng",
    ".out", ".cmake", ".java", ".pdm", ".index", ".pdf", ".t7", ".pcd", ".dat", ".idx", ".prof", ".rst", ".js", ".in",
    ".cc", ".tfrecords", ".pbtxt", ".scsv", ".dict", ".proper", ".txt2", ".tag", ".value", ".mexa64", ".tpl", ".pptx",
    ".exe", ".pxd", ".binaryproto", ".calibration", ".ig", ".tx", ".tfrecord", ".filter", ".solverstate", ".mhd",
    ".zraw", ".raw", ".pb", ".pgm", ".ppm", ".uff", ".pyt", ".wts", ".cloc", ".runlog", ".pfm", ".model", ".lst", ".wav",
    ".2runlog", ".gt", "nii", ".sdf", ".ann", ".pm", ".mo", ".sample", ".la", ".so", ".so.1", ".so.2", ".so.3", ".so.4",
    ".spec", ".nii.gz", ".cfg", ".ckpt", ".arw", ".go", ".m4", ".plist", ".sln", ".vcproj", ".params", ".states",
    ".rsrc", ".sip", ".qm", ".onnx", ".kep", ".score", ".input", ".supp", ".natvis", ".lds", ".npz", ".exr", ".svg",
    ".rawplain16", ".nv21", ".p", ".mexw32", ".mexw64", ".mexglx", ".mexmaci64", ".mexmaci", ".mexmaci64", ".bag",
    ".ttf", ".acv", ".crdownload", ".pl", ".args", ".config", ".aif", ".ape", ".mpc", ".wmv", ".aa", ".bpg", ".btf",
    ".cr3", ".crw", ".dr4", ".vrd", ".eip", ".dcm", ".dpx", ".dv", ".djvu", ".dylib", ".elf", ".macho", ".flac", ".ogg",
    ".flif", ".fpf", ".swf", ".ppt", ".afm", ".dfont", ".pfa", ".pfb", ".raf", ".xcf", ".gpx", ".igc", ".kml", ".txt~",
    ".icc", ".itc", ".indd", ".j2c", ".jp2", ".lnk", ".lfp", ".mts", ".mie", ".miff", ".moi", ".mxf", ".mrw", ".nef",
    ".docx", ".dss", ".ods", ".opus", ".pgf", ".pict", ".xmp", ".psp", ".mobi", ".rw2", ".iiq", ".psd", ".m4a", ".webp",
    ".rtf", ".hdr", ".ra", ".ram", ".rm", ".r3d", ".x3f", ".pmp", ".torrent", ".ics", ".vcf", ".wtv", ".inx", ".numbers",
    ".cr2", ".cntk", ".feature", ".runner", ".toml", ".mk", ".stamp", ".hh", ".f", ".sub", ".am", ".ac", ".vim", ".el",
    ".vbs", ".xls", ".lml", ".db", ".avro", ".flo", ".dump", ".lic", ".filtered", ".path", ".rockspec", ".dav", ".hik",
    ".nef", ".template", ".bat", ".interp", ".vtp", ".xsl", ".ebuild", ".patch", ".mask", ".defaults", ".inc", ".sens",
    ".py~", ".md5", ".info", ".trans", ".vg", ".cdf", ".h5", ".ta.gz", ".txz", ".old", ".np", ".inv", ".pem", ".obj",
    ".heic", ".nv12", ".eff", ".dll", ".res", ".lck", ".tmp", ".cache", ".bullet", ".plan", ".filters", ".xcscheme",
    ".diff", ".cav", ".install", ".properties", ".f90", ".dist", ".rc", ".stl", ".xacro", ".urdf", ".dae", ".mtl",
    ".inl", ".ino", ".glsl", ".cl", ".mm", ".command", "bsp", ".d", ".make", ".pov", ".osl", ".manifest", ".nsi", ".ico",
    ".po", ".blend", ".desktop", ".spi1d", ".spi3d", ".spimtx", ".icns", ".blender", ".pt", ".pak", ".css", ".dtd",
    ".gir", ".its", ".loc", ".url", ".sed", ".sin", ".header", ".charset", ".tcl", ".alias", ".qml", ".qmltypes", ".prf",
    ".qph", ".jar", ".gradle", ".mpg", ".rmvb", ".part", ".okl"]

FILE_EXT = [".zip", ".tar", ".tar.gz", ".rar", ".tgz", ".tar.bz2", ".7z"]
NUM_SHOW_DIR = 222
NUM_SUPPRESS = 11111
PATTERN_DETECT_THRESHOLD = 33
MIN_DEPTH = 1
DEBUG = [false]

iskeepdir(d) = try
    return !(match(r"^\d+$", d) !== nothing ||
            any(x->endswith(lowercase(d), x), STOPS_END) ||
            any(x->startswith(lowercase(d), x), STOPS_START) ||
            any(x->lowercase(d) == x, STOPS_FULL) ||
            any(x->occursin(x, lowercase(d)), STOPS_IN))
catch
    return false
end

isfileheurstic(f) = try
    return any(x->endswith(lowercase(f), x), FILE_EXT)
catch
    return false
end

iskeepfile(f) = try
    if any(x->endswith(lowercase(f), x), FILE_EXT)
        ('0' <= f[1] <= '9') || return true
        return tryparse(Int, rsplit(f, "."; limit = 2)[1]) === nothing
    end
    return false
catch
    return false
end

ispasscheck(f, p) = try
    any(x->startswith(lowercase(f), x), SKIP_START) && return true
    any(x->occursin(x, lowercase(f)), SKIP_IN) && return true
    any(x->endswith(lowercase(f), x), PASS_EXT) && return true
    any(x->lowercase(f) == x, SKIP_FULL) && return true
    if startswith(f, p)
        s = split(f, r"[._-]", limit = 2, keepempty = false)
        length(s) == 2 && s[1] == p && tryparse(Int, s[2]) !== nothing && return true
    end
    return false
catch
    return true
end

haspatternquick(list) = try
    l = length(list[1])
    if l > 0 && !occursin("batch", list[1]) && all(length(f) == l for f in list)
        l > 1 && length(list) > PATTERN_DETECT_THRESHOLD * 3 && return true
        l > 2 && length(list) > PATTERN_DETECT_THRESHOLD && return true
        l > 6 && length(list) > PATTERN_DETECT_THRESHOLD / 2 && return true
        l > 10 && length(list) > PATTERN_DETECT_THRESHOLD / 3 && return true
        l > 15 && length(list) > PATTERN_DETECT_THRESHOLD / 4 && return true
        l > 30 && length(list) > PATTERN_DETECT_THRESHOLD / 5 && return true
        l > 40 && length(list) > PATTERN_DETECT_THRESHOLD / 6 && return true
        l > 50 && length(list) > PATTERN_DETECT_THRESHOLD / 9 && return true
    end
    return false
catch
    return false
end

haspattern(list, p) = try
    list = [rsplit(f, "."; limit = 2)[1] for f in list]
    if length(list) > PATTERN_DETECT_THRESHOLD / 6 && !occursin("batch", list[1]) && (m = match(r"^(.*?[^\d])\d+$", list[1])) !== nothing
        length(m.captures[1]) > 1 && all(startswith.(list, m.captures[1])) && return true
    end
    length(list) < PATTERN_DETECT_THRESHOLD / 4 && return false
    all(occursin.("batch", list)) && return false
    nu = length(unique(length.(list)))
    nu == 1 && length(list[1]) == 2 && length(list) > PATTERN_DETECT_THRESHOLD * 2 && return true
    nu == 1 && length(list[1]) > 2 && length(list) > PATTERN_DETECT_THRESHOLD && return true
    nu == 1 && length(list[1]) > 15 && length(list) > PATTERN_DETECT_THRESHOLD / 3 && return true
    nu == 2 && length(list) > PATTERN_DETECT_THRESHOLD * 3 && return true
    nu == 1 && !occursin("batch", list[1]) && all(startswith.(list, p)) && return true
    if length(list) > PATTERN_DETECT_THRESHOLD / 2 && match(r"^(.*?)[\d_-]*$", list[1]).captures[1] == ""
        all(match(r"^(.*?)[\d_-]*$", f).captures[1] == "" for f in list) && return true
    end
    if length(list) > PATTERN_DETECT_THRESHOLD * 3 && match(r"^(.*?[^\d])\d+$", list[1]) !== nothing
        nreduce = length(unique([match(r"^(.*?)[\d_-]*$", f).captures[1] for f in list]))
        nreduce / length(list) < 0.1 && return true
    end
    if length(list) > PATTERN_DETECT_THRESHOLD * 3 && nu < 10
        lens = length.(list)
        unilens = unique(lens)
        any(sum(lens .== l) > length(list) - 5 for l in unilens) && return true
        lens = collect(setdiff(Set(unilens), Set([24, 32])))
        length(lens) <= 5 && sum(lens .== lens[1]) < max(10, length(list) / 50) && return true
    end
    if length(list) > PATTERN_DETECT_THRESHOLD * 4
        pattern_starts = ["giphy-", "bing-", "yt-", "vine-", "getty-", "flickr-"]
        any(sum(startswith.(list, site)) > PATTERN_DETECT_THRESHOLD for site in pattern_starts) && return true
    end
    return false
catch
    return false
end

function walk(root, depth = 0, parentname = "^")
    content = nothing
    try
        content = readdir(root)
    catch
        c = Channel(0)
        close(c)
        return c
    end

    dirs = Vector{eltype(content)}()
    files = Vector{eltype(content)}()

    if length(content) < NUM_SUPPRESS * 2
        if !haspatternquick(content)
            for name in content
                ispasscheck(name, parentname) && continue
                try
                    if depth == 0 || length(dirs) < NUM_SHOW_DIR
                        DEBUG[] && !isfileheurstic(name) && !isdir(joinpath(root, name)) && println(joinpath(root, name))
                        if (!isfileheurstic(name)) && isdir(joinpath(root, name))
                            iskeepdir(name) && push!(dirs, name)
                        else
                            iskeepfile(name) && push!(files, name)
                        end
                    else
                        push!(files, name)
                    end
                catch
                end
            end
        end
    end

    # if > NUM_SHOW_DIR, do not go deeper, transform them to files
    if depth > MIN_DEPTH && length(dirs) >= NUM_SHOW_DIR
        prepend!(files, dirs)
        empty!(dirs)
    end

    # if > NUM_SUPPRESS, do not show files
    if length(files) > NUM_SUPPRESS
        empty!(files)
    end

    # detect pattern
    haspattern(dirs, parentname) && empty!(dirs)
    haspattern(files, parentname) && empty!(files)

    function _it(chnl)
        put!(chnl, (root, dirs, files))
        for dir in dirs
            path = joinpath(root, dir)
            if !islink(path)
                for (root_l, dirs_l, files_l) in walk(path, depth + 1, dir)
                    put!(chnl, (root_l, dirs_l, files_l))
                end
            end
        end
    end

    return Channel(_it)
end

function dataindex(ROOTDIR)
    for (root, dirs, files) in walk(ROOTDIR)
        DEBUG[] || println(root)
        for f in files
            DEBUG[] || println(joinpath(root, f))
        end
    end
end

end # module
