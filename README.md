# Table of Contents
* [Scope](#scope)
* [Usage](#usage)
  * [Examples](#examples)
* [Benchmarks](#benchmarks)
  * [Platform](#platform)
  * [Workload](#workload)
  * [Records](#records)
  * [Considerations](#considerations)

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

# Benchmarks
I benchmarked the JDA Crystal version against a specific branch of the Ruby one: the reason is that Crystal currently dos not include a library to deal with TAR archives, so i decided to parse plain TXT files.

## Platform
I registered these benchmarks with a MacBook PRO 15 late 2011 having these specs:
* OSX El Captain
* 2,2 GHz Intel Core i7 (4 cores)
* 8 GB 1333 MHz DDR3

## Workload
I stressed the libraries by applying the markdown filter to four CSV with the following features:
 
| Name                   |     Weight (MB) |    Rows numbers |
| :--------------------- | --------------: | --------------: |
| ebuskr.txt             |             11  |          49662  |
| ebuseu.txt             |             42  |         189629  |
| ebuspf1.txt            |            160  |         343873  |
| ebuswh.txt             |            406  |        1845130  |

## Records
I recorded these numbers by inspecting the RAM and CPU consumption via XCode Instruments and by prepending each run with the *time* command.  

| Platform               |        Execution time  |     Memory peaks (GB) |
| :--------------------- | ---------------------: | --------------------: |
| Ruby                   |             1m39.160s  |                 2.79  |
| Crystal                |             0m19.816s  |                 1.26  |

## Considerations
Crystal proved to be blazing fast slurping large files in memory and filtering data.  
Indeed the Ruby version leverage on one process per CSV, while Crystal runs on one thread only.  
Said that Crystal throughput is about x5 than ruby ones (i recorded similar results with a GO versions, that runs on all cores) 
