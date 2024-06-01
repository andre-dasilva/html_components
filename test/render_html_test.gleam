import elements
import gleam/list
import gleeunit/should
import html
import render

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
