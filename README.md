# Markdown Resume Builder

In looking for a good way to manage my resume, in a way that's easy to write up, as well as easy to render to PDF and a website, I created this repo which utilizes Pandoc, GPP, and Chromium.

**Example:**
| [Input Markdown](resume.md) | [Output HTML](docquantum.github.com/) | [Output PDF](docquantum.github.com/) |
| :-: | :-: | :-: |

## Usage

Create a [`resume.md`](resume.md) with desired content and then run [`build.sh`](build.sh) on a system with `pandoc`, `gpp`, and `chromium-browser` installed.

```sh
./build.sh
```

## Template

The main web template is [`template.html`](template.html). The web stylesheet is `style.css` which is to be deployed alongside the rendered website.

The PDF template is [`template-pdf.html`](template-pdf.html). It uses the [`pdf.css`](pdf.css) stylesheet to render out to web, after which `chromium-browser` is invoked to print to a pdf based on the visible HTML. The CSS specifies a special print attribute as well to define thinner margins and page breaking behavior.

## Resume

The resume itself is _not_ standard markdown. It makes use of Pandoc extensions as well as GPP preprocessor macros to allow for the same document to both house the "public" and "private" variants of the resume simultaneously.

Sections of the resume are broken up using raw HTML (previously Pandoc [`fenced_divs`](https://pandoc.org/chunkedhtml-demo/8.18-divs-and-spans.html#extension-fenced_divs) were used). Pandoc's [`bracket_spans`](https://pandoc.org/chunkedhtml-demo/8.18-divs-and-spans.html#extension-bracket_spans) are also used to help organize subtext (although, it could be done with raw HTML at this point as well).

Most of the heavy lifting is taken care of by the CSS and HTML.

See [`resume.md`](resume.md) to see the used features and extensions.
