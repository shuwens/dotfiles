#!/usr/bin/python

# recompute aggregegate throughput in case iperf doesn't report it properly

import sys
import re
import itertools

ipLineStr = r'.*\[.*([0-9]+)\].*?([0-9]+\.[0-9]+)-.*?([0-9]+\.[0-9]+).sec.*?([0-9]+\.[0-9]+.[GMK])bits/sec.*'
ipLine = re.compile(ipLineStr)

def parseBw(s):
    sp = s.split()
    b = float(sp[0])
    if sp[1] == 'K':
        return b * 1e3
    elif sp[1] == 'M':
        return b * 1e6
    elif sp[1] == 'G':
        return b * 1e9


def read(fn):
    with open(fn, 'r') as f:
        for line in f:
            m = ipLine.match(line)
            if m is None:
                continue
            grp = m.groups()
            assert len(grp) == 4
            yield float(grp[0]), float(grp[1]), float(grp[2]), parseBw(grp[3])


def report(fn):
    ls = [l for l in sorted(read(fn), key=lambda g:g[1]) if l[2] - l[1] < 3]
    t = {}
    for k, g in itertools.groupby(ls, lambda g:g[1]):
        t[k] = sum(i[-1] for i in g)

    return t


def printReport(rep):
    tot = 0
    for k in sorted(rep.keys()):
        print k, rep[k]
        tot += rep[k]

    print 'tot', tot/len(rep)


if __name__ == '__main__':
    rep = report(sys.argv[1])
    printReport(rep)
