import sys

data = []

def main(argv):

  boundaries = [float(x) for x in argv[1:len(argv)]]
  mark = 0
  last_mark = 0.0

  for line in sys.stdin:
    if not line.startswith('"'):
      l = line.split(',')
      if mark < len(boundaries):
        if round(float(l[0]),2) == boundaries[mark]:
          mark += 1
          last_mark = float(l[0])
      data.append((round(float(l[0]) - last_mark, 2), int(l[1])))

  for tup in data:
    print str(tup[0]) + ',' + str(tup[1])


if __name__ == '__main__':
  main(sys.argv)
