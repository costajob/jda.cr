# Table of Contents
* [Scope](#scope)
* [Usage](#usage)
  * [Examples](#examples)

# Scope
This library is aimed to parse and extract data from CSV JDA files basing on the specified filters.

# Usage
Compile the program and use form command line:
```
crystal compile --release src/jda.cr
```

Print the help manual:
```
./jda -h
```

## Examples
Filter feeds into the */jda* folder by markdown price, stores and specified SKUs:
```
./jda -o /jda -x -t 21005,21006 -k 804511615,806732962,800907730
```
