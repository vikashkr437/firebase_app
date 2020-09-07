#!/usr/bin/python3

import subprocess
import cgi
import json
print("content-type: text/html")
print()

form = cgi.FieldStorage()

x = form.getvalue('x')
output = subprocess.getstatusoutput("sudo " + x)
status = output[0]
cmdoutput = output[1]

db = { "output": cmdoutput, "status": status }

finalo = json.dumps(db)
print(finalo)

