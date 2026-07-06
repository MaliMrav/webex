###############################################################################
# Data writing
# Copyright (c) 2026 Vladimir Lekic
#
###############################################################################
# writer.py

from pathlib import Path
from .models import ExtractionResult

def write_tsv(
    path: Path,
    results: list[ExtractionResult],
) -> None:
    with path.open("w", encoding="utf-8") as f:
        f.write("label\textracted\n")
        for result in results:
            value = result.extracted or ""
            f.write(f"{result.label}\t{value}\n")