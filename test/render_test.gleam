import elements
import gleam/list
import gleeunit/should
import html
import render
import xml

fn paragraph(text: String) {
  html.p([], [elements.escape_text(text)])
}

fn meta() {
  html.meta([
    elements.attr("name", "author"),
    elements.attr("content", "André da Silva"),
  ])
}

pub fn escape_test() {
  let tests = [
    #(
      "<script>alert('hello world')</script>",
      "&lt;script&gt;alert(&#x27;hello world&#x27;)&lt;&#x2F;script&gt;",
    ),
    #("\"hello\"", "&quot;hello&quot;"),
    #("c://", "c:&#x2F;&#x2F;"),
  ]

  list.map(tests, fn(t) {
    let #(input, expected) = t
    should.equal(render.escape(input), expected)
  })
}

pub fn render_single_paragraph_test() {
  let input = paragraph("Hello")

  let expected = "<p>Hello</p>"

  render.element(input)
  |> should.equal(expected)
}

pub fn render_single_meta_test() {
  let input = meta()

  let expected = "<meta name=\"author\" content=\"André da Silva\" />"

  render.element(input)
  |> should.equal(expected)
}

pub fn render_multiple_paragraph_test() {
  let input =
    html.html([elements.attr("lang", "en")], [
      paragraph("Hello"),
      paragraph("World"),
    ])

  let expected =
    "<!DOCTYPE html><html lang=\"en\"><p>Hello</p><p>World</p></html>"

  render.html(input)
  |> should.equal(expected)
}

pub fn render_nested_html_test() {
  let input =
    html.html([elements.attr("lang", "en")], [
      html.head([], [html.title("Nested")]),
      html.body([], [
        html.h1([], [elements.escape_text("Hello")]),
        html.div([elements.attr("class", "text-2xl")], [
          html.p([], [elements.escape_text("What a nice library")]),
        ]),
      ]),
    ])

  let expected =
    "<!DOCTYPE html><html lang=\"en\"><head><title>Nested</title></head><body><h1>Hello</h1><div class=\"text-2xl\"><p>What a nice library</p></div></body></html>"

  render.html(input)
  |> should.equal(expected)
}

pub fn render_simple_xml_test() {
  let book_element = fn(id: String, author: String, title: String) {
    elements.element("book", [elements.attr("id", id)], [
      elements.element("author", [], [elements.escape_text(author)]),
      elements.element("title", [], [elements.escape_text(title)]),
    ])
  }

  let books_element = fn(books) { elements.element("books", [], books) }

  let input =
    books_element([
      book_element("1", "J. K. Rowling", "Philosopher's Stone"),
      book_element("2", "Douglas Adams", "The Hitchhiker's Guide to the Galaxy"),
    ])

  let expected =
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?><books><book id=\"1\"><author>J. K. Rowling</author><title>Philosopher&#x27;s Stone</title></book><book id=\"2\"><author>Douglas Adams</author><title>The Hitchhiker&#x27;s Guide to the Galaxy</title></book></books>"

  render.xml(input)
  |> should.equal(expected)
}

pub fn render_xml_cdata_test() {
  let input =
    elements.element("book", [elements.attr("id", "1")], [
      elements.element("comment", [], [
        elements.cdata(
          "Author said: <quote>The answer to everything is 42</quote>",
        ),
      ]),
    ])

  let expected =
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?><book id=\"1\"><comment><![CDATA[Author said: <quote>The answer to everything is 42</quote>]]></comment></book>"

  render.xml(input)
  |> should.equal(expected)
}

pub fn render_sitemap_test() {
  let input = [
    xml.SitemapUrl(loc: "https://www.example.com/foo", lastmod: "2022-06-04"),
    xml.SitemapUrl(loc: "https://www.example.com/bar", lastmod: "2022-06-05"),
    xml.SitemapUrl(loc: "https://www.example.com/hello", lastmod: "2022-06-10"),
  ]
  let sitemap = xml.sitemap(input)

  let expected =
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?><urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\"><url><loc>https://www.example.com/foo</loc><lastmod>2022-06-04</lastmod></url><url><loc>https://www.example.com/bar</loc><lastmod>2022-06-05</lastmod></url><url><loc>https://www.example.com/hello</loc><lastmod>2022-06-10</lastmod></url></urlset>"

  render.xml(sitemap)
  |> should.equal(expected)
}
