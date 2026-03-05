import std/[
  strutils,
  math
]

type
  Day2Object = object
    numbers: seq[int]
  Day2Sequence = seq[Day2Object]

proc day2parse(input: string)

# Day 1
type
  Day1Object = object
    sign: int
    rotations: int
    moves: int
  Day1Sequence = seq[Day1Object]

proc day1parse(input: string): Day1Sequence =
  var
    data: Day1Sequence
    numPart: int
  for line in input.strip().splitLines():
    numPart = parseInt(line[1..(line.len-1)])
    data.add(
      Day1Object(
        sign: if line[0] == 'L': -1 else: 1,
        rotations: numPart.euclDiv(100),
        moves: numPart.euclMod(100)
      )
    )
  return data

proc day1process1(ends: int): int =
  var value: int = if (ends == 0): 1 else: 0
  return value

proc day1process2(sign: int, rotations: int, starts: int, movement: int, ends: int): int =
  var
    value: int = 0
    startsZero: int = (starts == 0).int()
    endsZero: int = (ends == 0).int()
    goingLeft: int = (sign == -1).int()
  value = movement.euclDiv(100).abs() + rotations
  value += goingLeft * (endsZero - startsZero)
  return value

proc day1*(input: string): string =
  # Counters
  var
    starts: int = 50
    movement: int = 0
    ends: int = 0
    counter: array[2, int] = [0, 0]
    data: Day1Sequence = day1parse(input)
  # Calculations
  for entry in data:
    movement = starts + entry.sign * entry.moves # Moves the dial
    ends = (100 + movement) mod 100 # Corrects the position to fit the range (0..99)
    counter[0] += day1process1(ends)
    counter[1] += day1process2(entry.sign, entry.rotations, starts, movement, ends)
    starts = ends
  # Return Answers
  return "First part answer: " & $counter[0] & "\n" &
    "Second part answer: " & $counter[1]
