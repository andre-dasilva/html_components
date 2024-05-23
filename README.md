# HTML components for gleam

[![Package Version](https://img.shields.io/hexpm/v/html_components)](https://hex.pm/packages/html_components)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/html_components/)
![Tests](https://github.com/andre-dasilva/html_components/actions/workflows/test.yml/badge.svg)

Generate HTML (or XML) from simple gleam functions

Further documentation can be found at <https://hexdocs.pm/html_components>.

## Getting Started

### Installation

```sh
gleam add html_components
```

### Usage

#### HTML

```gleam
import elements
import html
import render

let input =
  html.html([elements.attr("lang", "en")], [
    html.head([], [html.title("Nested")]),
    html.body([], [
      html.h1([], [elements.text("Hello")]),
      html.div([elements.attr("class", "text-2xl")], [
        html.p([], [elements.text("What a nice library")]),
      ]),
    ]),
  ])

render.html(input)
// <!DOCTYPE html><html lang="en"><head><title>Nested</title></head><body><h1>Hello</h1><div class="text-2xl"><p>What a nice library</p></div></body></html>
```

#### XML
Since the functions are quite generic, its also possible to generate xml

```gleam
import elements
import render

let book_element = fn(id: String, author: String, title: String) {
  elements.element("book", [elements.attr("id", id)], [
    elements.element("author", [], [elements.text(author)]),
    elements.element("title", [], [elements.text(title)]),
  ])
}

let books_element = fn(books) { elements.element("books", [], books) }

let input =
  books_element([
    book_element("1", "J. K. Rowling", "Philosopher's Stone"),
    book_element("2", "Douglas Adams", "The Hitchhiker's Guide to the Galaxy")
  ])

render.xml(input)
// <?xml version="1.0" encoding="UTF-8"?><books><book id="1"><author>J. K. Rowling</author><title>Philosopher&#x27;s Stone</title></book><book id="2"><author>Douglas Adams</author><title>The Hitchhiker&#x27;s Guide to the Galaxy</title></book></books>
```

## Development

Fork the project and clone it

You can run the tests with:

```sh
gleam test
```
