###############################################################################
# Data extraction
# Copyright (c) 2026 Vladimir Lekic
#
###############################################################################
# extractor.py

import re

class RegexExtractor:
    def __init__(self, pattern: str):
        self.regex = re.compile(pattern)
    def extract(self, html: str) -> str | None:
        match = self.regex.search(html)
        if match:
            return match.group(0)
        return None