###############################################################################
# Configuration generation
# Copyright (c) 2026 Vladimir Lekic
#
###############################################################################
# generator.py

from collections.abc import Iterator

def generate(
    template: str,
    start: int,
    end: int,
) -> Iterator[tuple[str, str]]:
    for number in range(start, end + 1):
        label = f"{number}"
        url = template.format(id=number)
        yield label, url