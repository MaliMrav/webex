###############################################################################
# Data models
# Copyright (c) 2026 Vladimir Lekic
#
###############################################################################
# models.py

from dataclasses import dataclass

@dataclass(slots=True)
class ExtractionResult:
    label: str
    source_url: str
    extracted: str | None