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
./jda --src=/jda --markdown --stores=20102,25099,23277,21400 --skus=806932926,807264831
```

# Benchmarks
I benchmarked the JDA Crystal version against a specific branch of the Ruby one: the reason is that Crystal currently dos not include a library to deal with TAR archives, so i decided to parse plain TXT files.

## Platform
I registered these benchmarks with a MacBook PRO 15 late 2011 having these specs:
* OSX El Captain
* 2,2 GHz Intel Core i7 (4 cores)
* 8 GB 1333 MHz DDR3

## Workload
I stressed the libraries by applying the *markdown filter* to four CSV with the following features:
 
| Name                   |     Weight (MB) |    Rows numbers |
| :--------------------- | --------------: | --------------: |
| ebuskr.txt             |             11  |          49662  |
| ebuseu.txt             |             42  |         189629  |
| ebuspf1.txt            |            160  |         343873  |
| ebuswh.txt             |            406  |        1845130  |

## Records
I recorded these numbers by inspecting the RAM and CPU consumption via XCode's Instruments and by prepending each run with the *time* command.  

| Platform               | Execution time (real)  |     Memory peaks (GB) |
| :--------------------- | ---------------------: | --------------------: |
| Ruby                   |             2m31.513s  |                 2.32  |
| Crystal                |             0m20.102s  |                 1.22  |

## Considerations
Crystal proved to be blazing fast reading large CSV file and filtering data.  
Ruby implementation relies on one process per CSV to grant parallel computation, while Crystal runs on one thread only.  
Said that Crystal execution time is about one tenth of Ruby one and consumes half of the memory.
