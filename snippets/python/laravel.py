import sys, os, vim
from all import *

def whereRoute(text, filename):
    results = re.findall("{([_a-zA-Z0-9]+)}", text)
    if results:
        text = "\n"
        for result in results:
            name  = result.split("_")[-1]
            model = title(result.split("_")[0])
            if name == "id":
                exp = "\d+"
            elif name == "slug":
                exp = "[\w\-]+"
            elif name == "username":
                exp = "[\w]+"
            else:
                exp = ""

            current = "Route::pattern('"+ result +"', '"+ exp +"');\n"
            ffile = open(filename, "r")

            found = False
            for line in ffile:
                if line == current:
                    found = True
                    break

            if not found:
                text += current
                if name == "id":
                    text += "Route::model('"+ result +"','"+ model +"');\n"
                else:
                    text += "Route::bind('"+ result +"', function($value, $route){\n"
                    text += "    return "+ model +"::where('"+ name +"', $value)->firstOrFail();\n"
                    text += "});\n"



        return text
    else:
        return '\n'
