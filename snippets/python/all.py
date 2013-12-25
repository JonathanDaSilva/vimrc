import re, vim, os

def getFileName(filepath):
    filename = filepath.split('\\')[-1]
    return filename.split('.')[0]

def getName(filepath, end):
    filename = getFileName(filepath)
    search = re.search("(\w+)" + end, filename)
    return search.group(1).lower()

def complete(t, opts):
    if t:
       opts = [m[len(t):] for m in opts if m.startswith(t)]
    if len(opts) == 1:
        return opts[0]
    return "("+ "|".join(opts[0:5]) +")"

def title(text):
    if len(text) == 1:
        return text.capitalize()
    elif len(text) > 1:
        return text[0].capitalize() + text[1:].lower()
    else:
       return ""

