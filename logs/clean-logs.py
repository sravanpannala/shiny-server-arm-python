#!/usr/bin/env python3

import glob

def remove_text(fl):
    with open(fl,"r") as f:
        lines = f.readlines()
    new_lines = []
    for line in lines:
        # print(line)
        if "findfont:" not in line.strip():
            new_lines.append(line)
    with open(fl,"w") as f:
         f.writelines(new_lines)

def main():

    for fl in glob.glob("*NBA-Distribution*"):
        remove_text(fl)


if __name__ == "__main__":
    main()

