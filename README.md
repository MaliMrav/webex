# webex

A minimal, composable web extraction pipeline CLI.

`webex` generates URLs from a template, fetches each page, extracts data using a regex pattern, and writes structured output to a TSV file.

It is designed as a small learning-focused pipeline demonstrating clean separation of concerns:

- URL generation
- HTTP fetching
- content extraction
- structured output writing

---

## 🧠 Philosophy

`webex` is not a scraper.

It is a **pipeline framework for iterating over structured web resources**.

Each stage is independent and replaceable.

---

## ⚙️ Installation

Clone the repository and install dependencies:

```bash
pip install requests
```

Run directly:
```bash
python -m webex fetch --help
```

**🚀 Usage**

*Basic example*

```bash
python -m webex fetch \\  
\--url-template "<https://example.com/page/{index}>" \\  
\--start 1 \\  
\--end 10 \\  
\--pattern "example" \\  
\--output output.tsv
```

**📥 How it works**

The pipeline is composed of four stages:

URL Generator → Fetcher → Extractor → Writer

- **URL Generator**  
   Expands a numeric range into URLs using a template.
- **Fetcher**  
   Retrieves HTML content via HTTP.
- **Extractor**  
   Applies a regex pattern to extract relevant data.
- **Writer**  
   Outputs results in TSV format.

**📄 Output format**

The output file is tab-separated:

label extracted  
1 ...  
2 ...  
3 ...

**🧩 Example**
```bash
python -m webex fetch \\  
\--url-template "<https://example.com/page/{index:02d}>" \\  
\--start 1 \\  
\--end 5 \\  
\--pattern "example" \\  
\--output results.tsv
```

**🛣️ Roadmap**

Future improvements:

- CSS and XPath extractors
- JSON output format
- retry + timeout handling
- streaming pipeline (no in-memory accumulation)
- configuration files (YAML/JSON)
- multiple extraction results per page

**🧠 Design principles**

- Each module has a single responsibility
- The pipeline is stateless and composable
- Extraction logic is pluggable
- CLI defines configuration, not behavior