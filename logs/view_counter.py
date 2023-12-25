#!/usr/bin/env python3

import os
import argparse

data_DIR = os.getcwd() + "/"

def parse_function():
    global app_name
    global itype
    global create_img
    parser = argparse.ArgumentParser(
        description="Get View counts stats for Shiny Apps",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    parser.add_argument(
        "--app",
        "-a",
        required=True,
        help="Type app name to get view counts",
    )
    args = parser.parse_args()

    app_name = args.app


def main():
    parse_function()
    logs = [s for s in  os.listdir(data_DIR) if app_name in s]
    connections = 0
    for log in logs:
        with open(data_DIR + log,"r") as f:
            log_text = f.read()
        connections += log_text.count("open")
    print(connections)


if __name__ == "__main__":
    main()
