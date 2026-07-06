###############################################################################
# Data processing pipeline
# Copyright (c) 2026 Vladimir Lekic
#
###############################################################################
# pipeline.py

from .generator import generate
from .fetcher import fetch
from .models import ExtractionResult

def run(generator, extractor):

    results = []
    for label, url in generator:
        html = fetch(url)
        extracted = extractor.extract(html)
        results.append(
            ExtractionResult(
                label=label,
                source_url=url,
                extracted=extracted,
            )
        )
    return results