# vuv
Easier use of package manager uv in the form of conda.<br>And this only need is uv.

# First of All
Thanks [Menghuan1918](https://github.com/Menghuan1918) create awsome shell script.

## Installation
First you need to install package manager [uv](https://github.com/astral-sh/uv).

Then run:

```bash
git clone https://github.com/Slipstream-Max/vuv.git
cd vuv
bash Install.sh
```

Just restart your terminal. I've tested it on: 
- bash(Linux)
- zsh(Linux)

Or you can download the `vuv` file separately and add `source vuv` to your terminal configuration
## Use

### Create a virtual environment named fastapi with Python version 3.10

```bash
vuv create -n fastapi -p 3.10
```

### Activate the environment you just created
```bash
vuv activate fastapi
```

### Deactivate this environment
```bash
vuv deactivate
```

### Remove this environment
```bash
vuv remove -n fastapi
```

For more details you can refer to `uvv help`.

### Use in VSCode

Just specify the location, e.g. the environment location for this is at `/home/menghuan_go/.venv/fastapi/bin/python`.

![image](https://github.com/Menghuan1918/uvv/assets/122662527/242145a8-d19b-4445-b5a4-f2ded74d4c34)
