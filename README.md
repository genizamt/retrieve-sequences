# retrieve-sequences
# takes file with list of headers (sequence names) and searches database sequence file and returns file with sequences of list file
# list file must NOT contain ">" - ONLY gene names
# example list file:
# AT1G01010
# AT1G01020
# AT1G01030
# AT1G01040

# usage: perl retrieve-sequences.pl {list file} {database sequence file} > {list file genes containing sequences}
