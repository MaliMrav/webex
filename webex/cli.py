###############################################################################
# Command-line interface
# Copyright (c) 2026 Vladimir Lekic
###############################################################################

import argparse
from pathlib import Path

from .extractor import RegexExtractor
from .generator import generate
from .pipeline import run
from .writer import write_tsv

def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="webex",
        description="General-purpose web extraction utility.",
    )
    subparsers = parser.add_subparsers(
        dest="command",
        required=True,
    )
    fetch = subparsers.add_parser(
        "fetch",
        help="Fetch URLs and extract data.",
    )
    fetch.add_argument("--url-template", required=True)
    fetch.add_argument("--start", type=int, required=True)
    fetch.add_argument("--end", type=int, required=True)
    fetch.add_argument("--pattern", required=True)
    fetch.add_argument("--output", required=True)
    return parser

def handle_fetch(args) -> None:
    extractor = RegexExtractor(args.pattern)
    urls = generate(
        args.url_template,
        args.start,
        args.end,
    )
    results = run(
        generator=urls,
        extractor=extractor,
    )
    write_tsv(
        Path(args.output),
        results,
    )

def main() -> None:
    parser = build_parser()
    args = parser.parse_args()
    if args.command == "fetch":
        handle_fetch(args)