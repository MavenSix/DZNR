#!/usr/bin/env python3
"""Render workflows/*.md into docs/workflows.html.

Single source of truth is the markdown. Run this after any edit:
    python3 scripts/build-workflows-html.py

No third-party dependencies. Parses the YAML frontmatter with a small
purpose-built reader (the schema is flat enough), renders the body with a
minimal markdown converter (headings, paragraphs, lists, code, tables,
bold, italic, inline code, links). Good enough for a reference document;
not a general markdown engine.
"""
from __future__ import annotations

import html
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
WF_DIR = ROOT / "workflows"
OUT = ROOT / "docs" / "workflows.html"

PALETTE = {
    "bone": "#f4f1ea",
    "charcoal": "#1f1d1a",
    "taupe": "#8b7f70",
    "ink": "#2b2926",
    "line": "#d9d3c7",
    "accent": "#b5533c",
    "stub": "#9a8f7f",
}


# ---------- frontmatter ----------

def split_frontmatter(text: str) -> tuple[str, str]:
    if not text.startswith("---"):
        return "", text
    end = text.find("\n---", 3)
    if end == -1:
        return "", text
    return text[3:end].strip("\n"), text[end + 4:].lstrip("\n")


def fm_scalar(fm: str, key: str) -> str:
    m = re.search(rf"^{re.escape(key)}:\s*(.*)$", fm, re.M)
    return m.group(1).strip().strip('"') if m else ""


def fm_list_inline(fm: str, key: str) -> list[str]:
    v = fm_scalar(fm, key)
    if v.startswith("[") and v.endswith("]"):
        inner = v[1:-1].strip()
        return [x.strip().strip('"') for x in inner.split(",") if x.strip()] if inner else []
    return []


def fm_block_list(fm: str, key: str) -> list[str]:
    """Return '- item' entries under a top-level key (one level)."""
    m = re.search(rf"^{re.escape(key)}:\s*$", fm, re.M)
    if not m:
        return []
    out = []
    for line in fm[m.end():].splitlines():
        if line and not line.startswith(" "):
            break
        s = line.strip()
        if s.startswith("- "):
            out.append(s[2:].strip().strip('"'))
    return out


def fm_stages(fm: str) -> list[dict]:
    m = re.search(r"^stages:\s*$", fm, re.M)
    if not m:
        return []
    block = []
    for line in fm[m.end():].splitlines():
        if line and not line.startswith(" "):
            break
        block.append(line)
    stages, cur = [], None
    for line in block:
        s = line.strip()
        if s.startswith("- id:"):
            cur = {"id": s.split(":", 1)[1].strip()}
            stages.append(cur)
        elif cur is not None and ":" in s and not s.startswith("- "):
            k, v = s.split(":", 1)
            cur[k.strip()] = v.strip().strip('"')
    return stages


def fm_triggers(fm: str) -> tuple[list[str], list[str]]:
    m = re.search(r"^triggers:\s*$", fm, re.M)
    if not m:
        return [], []
    block = "\n".join(l for l in fm[m.end():].splitlines() if l.startswith(" ") or not l)
    typed = re.search(r"typed:\s*(\[.*?\])", block, re.S)
    spoken = re.search(r"spoken:\s*(\[.*?\])", block, re.S)
    def parse(g):
        if not g:
            return []
        return [x.strip().strip('"') for x in g.group(1)[1:-1].replace("\n", " ").split('",') if x.strip().strip('"')]
    return parse(typed), parse(spoken)


# ---------- markdown ----------

def inline(s: str) -> str:
    s = html.escape(s, quote=False)
    s = re.sub(r"`([^`]+)`", r"<code>\1</code>", s)
    s = re.sub(r"\*\*([^*]+)\*\*", r"<strong>\1</strong>", s)
    s = re.sub(r"(?<![*\w])\*([^*]+)\*(?![*\w])", r"<em>\1</em>", s)
    s = re.sub(r"\[([^\]]+)\]\(([^)]+)\)", r'<a href="\2">\1</a>', s)
    return s


def md_to_html(md: str) -> str:
    out, i, lines = [], 0, md.splitlines()
    while i < len(lines):
        line = lines[i]
        if line.startswith("```"):
            buf = []
            i += 1
            while i < len(lines) and not lines[i].startswith("```"):
                buf.append(lines[i]); i += 1
            out.append("<pre><code>" + html.escape("\n".join(buf)) + "</code></pre>")
            i += 1; continue
        if line.startswith("|") and i + 1 < len(lines) and re.match(r"^\|[\s:|-]+\|$", lines[i + 1]):
            hdr = [c.strip() for c in line.strip("|").split("|")]
            i += 2
            rows = []
            while i < len(lines) and lines[i].startswith("|"):
                rows.append([c.strip() for c in lines[i].strip("|").split("|")]); i += 1
            t = "<table><thead><tr>" + "".join(f"<th>{inline(h)}</th>" for h in hdr) + "</tr></thead><tbody>"
            for r in rows:
                t += "<tr>" + "".join(f"<td>{inline(c)}</td>" for c in r) + "</tr>"
            out.append(t + "</tbody></table>"); continue
        m = re.match(r"^(#{1,6})\s+(.*)$", line)
        if m:
            lvl = len(m.group(1)); out.append(f"<h{lvl}>{inline(m.group(2))}</h{lvl}>"); i += 1; continue
        if re.match(r"^\s*[-*]\s+", line):
            items = []
            while i < len(lines) and re.match(r"^\s*[-*]\s+", lines[i]):
                items.append(re.sub(r"^\s*[-*]\s+", "", lines[i])); i += 1
            out.append("<ul>" + "".join(f"<li>{inline(x)}</li>" for x in items) + "</ul>"); continue
        if re.match(r"^\s*\d+\.\s+", line):
            items = []
            while i < len(lines) and re.match(r"^\s*\d+\.\s+", lines[i]):
                items.append(re.sub(r"^\s*\d+\.\s+", "", lines[i])); i += 1
            out.append("<ol>" + "".join(f"<li>{inline(x)}</li>" for x in items) + "</ol>"); continue
        if line.strip() == "---":
            out.append("<hr>"); i += 1; continue
        if not line.strip():
            i += 1; continue
        para = [line]; i += 1
        while i < len(lines) and lines[i].strip() and not re.match(r"^(#|```|\||\s*[-*]\s|\s*\d+\.\s|---)", lines[i]):
            para.append(lines[i]); i += 1
        out.append("<p>" + inline(" ".join(para)) + "</p>")
    return "\n".join(out)


# ---------- page ----------

CSS = f"""
:root{{--bone:{PALETTE['bone']};--charcoal:{PALETTE['charcoal']};--taupe:{PALETTE['taupe']};--ink:{PALETTE['ink']};--line:{PALETTE['line']};--accent:{PALETTE['accent']};--stub:{PALETTE['stub']}}}
*{{box-sizing:border-box}}
body{{margin:0;background:var(--bone);color:var(--ink);font:16px/1.6 Georgia,'Times New Roman',serif}}
header{{padding:48px 32px 24px;border-bottom:1px solid var(--line)}}
header h1{{font:600 34px/1.15 Helvetica,Arial,sans-serif;margin:0 0 8px;letter-spacing:-.01em}}
header p{{margin:0;color:var(--taupe);font:14px/1.5 Helvetica,Arial,sans-serif}}
.wrap{{display:grid;grid-template-columns:260px 1fr;min-height:100vh}}
nav{{position:sticky;top:0;align-self:start;height:100vh;overflow:auto;padding:24px 20px;border-right:1px solid var(--line);font:13px/1.5 Helvetica,Arial,sans-serif}}
nav a{{display:block;color:var(--ink);text-decoration:none;padding:4px 0}}
nav a:hover{{color:var(--accent)}}
nav .stub{{color:var(--stub)}}
nav .group{{margin:14px 0 6px;color:var(--taupe);text-transform:uppercase;letter-spacing:.08em;font-size:11px}}
main{{padding:24px 48px 96px;max-width:960px}}
article{{padding:40px 0;border-bottom:1px solid var(--line)}}
article h1{{font:600 28px/1.2 Helvetica,Arial,sans-serif;margin:0 0 4px}}
article h2{{font:600 18px/1.3 Helvetica,Arial,sans-serif;margin:32px 0 8px}}
article h3{{font:600 15px/1.3 Helvetica,Arial,sans-serif;margin:22px 0 6px}}
.meta{{display:flex;flex-wrap:wrap;gap:8px;margin:12px 0 18px;font:12px/1 Helvetica,Arial,sans-serif}}
.meta span{{border:1px solid var(--line);padding:6px 10px;border-radius:3px;background:#fff}}
.meta .status-complete{{background:var(--charcoal);color:var(--bone);border-color:var(--charcoal)}}
.meta .status-stub{{background:var(--stub);color:#fff;border-color:var(--stub)}}
.stages{{width:100%;border-collapse:collapse;font:13px/1.45 Helvetica,Arial,sans-serif;margin:8px 0 16px}}
.stages th,.stages td{{text-align:left;vertical-align:top;padding:8px 10px;border-bottom:1px solid var(--line)}}
.stages th{{color:var(--taupe);font-weight:600;text-transform:uppercase;letter-spacing:.06em;font-size:11px}}
.stages .cp{{color:var(--accent);font-weight:600}}
table{{border-collapse:collapse;width:100%;font:14px/1.45 Helvetica,Arial,sans-serif;margin:8px 0 16px}}
th,td{{text-align:left;vertical-align:top;padding:8px 10px;border-bottom:1px solid var(--line)}}
code{{font:13px/1.4 'JetBrains Mono',Menlo,monospace;background:#fff;border:1px solid var(--line);padding:1px 4px;border-radius:2px}}
pre{{background:#fff;border:1px solid var(--line);padding:14px;overflow:auto;font:13px/1.45 'JetBrains Mono',Menlo,monospace}}
pre code{{border:0;padding:0;background:none}}
.triggers{{font:13px/1.5 Helvetica,Arial,sans-serif;color:var(--taupe);margin:0 0 12px}}
.triggers b{{color:var(--ink)}}
.oq{{border-left:3px solid var(--stub);padding:8px 14px;background:#fff;margin:12px 0}}
@media(max-width:860px){{.wrap{{grid-template-columns:1fr}}nav{{position:static;height:auto;border-right:0;border-bottom:1px solid var(--line)}}main{{padding:24px}}}}
"""


def render_article(path: Path) -> tuple[str, str, str, str]:
    text = path.read_text(encoding="utf-8")
    fm, body = split_frontmatter(text)
    wid = fm_scalar(fm, "workflow") or path.stem
    name = fm_scalar(fm, "name") or path.stem
    status = fm_scalar(fm, "status") or "stub"
    lead = fm_scalar(fm, "lead")
    supporting = fm_list_inline(fm, "supporting")
    chains = fm_list_inline(fm, "chains")
    cost = fm_scalar(fm, "cost_envelope_usd")
    time_env = fm_scalar(fm, "time_envelope")
    conf = fm_scalar(fm, "confidential_default")
    typed, spoken = fm_triggers(fm)
    stages = fm_stages(fm)
    oq = fm_block_list(fm, "open_questions")

    meta = [f'<span class="status-{status}">{status}</span>', f"<span>lead: {html.escape(lead)}</span>"]
    if supporting:
        meta.append(f"<span>with: {html.escape(', '.join(supporting))}</span>")
    if chains:
        meta.append(f"<span>chains: {html.escape(', '.join(chains))}</span>")
    if cost and cost != "[0, 0]":
        meta.append(f"<span>cost: ${html.escape(cost.strip('[]').replace(', ', ' to '))}</span>")
    if time_env and time_env != "TBD":
        meta.append(f"<span>time: {html.escape(time_env)}</span>")
    if conf == "true":
        meta.append("<span>confidential by default</span>")

    trig = ""
    if typed or spoken:
        trig = '<p class="triggers">'
        if spoken:
            trig += "<b>Say:</b> " + " &middot; ".join(html.escape(t) for t in spoken) + "<br>"
        if typed:
            trig += "<b>Type:</b> " + " &middot; ".join(html.escape(t) for t in typed)
        trig += "</p>"

    st = ""
    if stages:
        st = '<table class="stages"><thead><tr><th>#</th><th>Stage</th><th>Owner</th><th>Chain node</th><th>Checkpoint</th><th>Gate</th><th>Exit ok</th></tr></thead><tbody>'
        for s in stages:
            cp = '<span class="cp">yes</span>' if s.get("checkpoint") == "true" else ""
            st += (f"<tr><td>{html.escape(s.get('id',''))}</td><td>{html.escape(s.get('name',''))}</td>"
                   f"<td>{html.escape(s.get('owner',''))}</td><td>{html.escape(s.get('chain_node','') if s.get('chain_node','') != 'null' else '')}</td>"
                   f"<td>{cp}</td><td>{html.escape(s.get('gate','') if s.get('gate','') != 'null' else '')}</td>"
                   f"<td>{'yes' if s.get('exit_allowed') == 'true' else ''}</td></tr>")
        st += "</tbody></table>"

    oqh = ""
    if oq:
        oqh = '<div class="oq"><strong>Open questions before this can be completed</strong><ul>' + "".join(f"<li>{inline(q)}</li>" for q in oq) + "</ul></div>"

    body_html = md_to_html(body)
    body_html = re.sub(r"^<h1>.*?</h1>\n?", "", body_html, count=1)  # title rendered from frontmatter
    art = f'<article id="{html.escape(wid)}"><h1>{html.escape(name)}</h1><div class="meta">{"".join(meta)}</div>{trig}{st}{oqh}{body_html}</article>'
    return wid, name, status, art


def main() -> int:
    if not WF_DIR.exists():
        print(f"missing {WF_DIR}", file=sys.stderr); return 1
    files = sorted(p for p in WF_DIR.glob("*.md") if not p.name.startswith("_") and p.name != "README.md")
    readme = WF_DIR / "README.md"
    _, readme_body = split_frontmatter(readme.read_text(encoding="utf-8")) if readme.exists() else ("", "")
    arts, nav_c, nav_s = [], [], []
    for p in files:
        wid, name, status, art = render_article(p)
        arts.append(art)
        (nav_c if status == "complete" else nav_s).append(f'<a href="#{wid}" class="{status}">{html.escape(name)}</a>')
    nav = '<a href="#master">Master document</a>'
    if nav_c:
        nav += '<div class="group">Complete</div>' + "".join(nav_c)
    if nav_s:
        nav += '<div class="group">Stubs</div>' + "".join(nav_s)
    master = f'<article id="master">{md_to_html(readme_body)}</article>'
    page = f"""<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>DZNR Workflows</title><style>{CSS}</style></head>
<body><header><h1>DZNR Workflows</h1><p>Generated from workflows/*.md by scripts/build-workflows-html.py. Edit the markdown, not this file. {len(nav_c)} complete, {len(nav_s)} stubs.</p></header>
<div class="wrap"><nav>{nav}</nav><main>{master}{"".join(arts)}</main></div></body></html>"""
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(page, encoding="utf-8")
    print(f"wrote {OUT.relative_to(ROOT)}: {len(nav_c)} complete, {len(nav_s)} stubs")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
