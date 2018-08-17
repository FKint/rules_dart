"""Common utilities for dealing with paths."""

def filter_files(filetypes, files):
    """Filters a list of files based on a list of strings."""
    filtered_files = []
    for file_to_filter in files:
        filename = file_to_filter
        if type(file_to_filter) != "string":
            filename = file_to_filter.basename
        for filetype in filetypes:
            if filename.endswith(filetype):
                filtered_files.append(file_to_filter)
                break

    return filtered_files

def relative_path(from_dir, to_path):
    """Returns the path from a directory for a path from the repo root."""
    if to_path.startswith("/") or from_dir.startswith("/"):
        fail("Absolute paths are not supported.")
    if not from_dir:
        return to_path
    return "../" * len(from_dir.split("/")) + to_path

def strip_extension(path):
    index = path.rfind(".")
    if index == -1:
        return path
    return path[0:index]
