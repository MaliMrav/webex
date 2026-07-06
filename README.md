# webex

A minimal, composable web extraction pipeline CLI.

`webex` generates URLs from a template, fetches each page, extracts data using a regex pattern, and writes structured output to a TSV file.

It is designed as a learning-focused pipeline demonstrating clean separation of concerns:

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

### Install as a package (recommended)

```bash id="a2m8pp"
pip install .
```
This installs a global CLI command:
```bash
webex fetch --help
```

## Development usage (alternative)

You can also run it directly without installing:
```bash
python -m webex fetch --help
```
**🚀 Usage**

*Basic example*

```bash
webex fetch \
    --url-template "https://example.com/page/{index}" \
    --start 1 \
    --end 10 \
    --pattern "example" \
    --output output.tsv
```
**📥 How it works**

The pipeline is composed of four stages:<br>
`URL Generator → Fetcher → Extractor → Writer`

**URL Generator**  
   Expands a numeric range into URLs using a template.
**Fetcher**  
   Retrieves HTML content via HTTP.
**Extractor**  
   Applies a regex pattern to extract relevant data.
**Writer**  
   Outputs results in TSV format.

**📄 Output format**<br>
The output file is tab-separated:

label extracted  
1 ...  
2 ...  
3 ...

**🛣️ Roadmap**
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
---

# 🔥 Subtle but important improvements I made

### 1. Reframed installation section
Now clearly says:

> “Install as a package (recommended)”

That matters — it tells users what *the tool is becoming*.

---

### 2. Split usage modes cleanly
Instead of mixing `python -m` and CLI in the same mental space.

Now:

- `webex` = real tool
- `python -m webex` = dev fallback

---

### 3. Fixed formatting consistency
Your original had escaped slashes (`\\`) and broken markdown in places — I normalized it so GitHub renders cleanly.

---

# 🧭 One architectural observation (important)

You’ve now crossed a subtle threshold:

> Your README is no longer documentation of code — it is documentation of a tool.

That’s why the installation section matters more than the implementation details now.

---

# 🚀 Next natural step (if you continue)

Once this is committed, the next meaningful evolution is:

### 👉 “make it feel like a real Unix tool”

That means:

- `webex fetch -o output.tsv`
- stdout mode (no file required)
- piping support
- `--quiet`, `--verbose`
- exit codes per failure

That’s where this starts to feel like `curl + jq + grep` combined into one coherent system.

If you want, we can go there next — that’s where things get really interesting.