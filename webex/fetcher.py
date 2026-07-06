###############################################################################
# Data fetching
# Copyright (c) 2026 Vladimir Lekic
#
###############################################################################
# fetcher.py

import requests

def fetch(url: str) -> str:
    response = requests.get(url, timeout=10)
    response.raise_for_status()
    return response.text