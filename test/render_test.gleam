import elements
import gleeunit/should
import render

fn paragraph(text: String) {
  elements.p([], [elements.text(text)])
}

fn meta() {
  elements.meta([
    elements.attr("name", "author"),
    elements.attr("content", "André da Silva"),
  ])
}

pub fn render_single_paragraph_test() {
  let input = paragraph("Hello")

  let expected = "<p>Hello</p>"

  render.render_element(input)
  |> should.equal(expected)
}

pub fn render_single_meta_test() {
  let input = meta()

  let expected = "<meta name=\"author\" content=\"André da Silva\" />"

  render.render_element(input)
  |> should.equal(expected)
}

pub fn render_multiple_paragraph_test() {
  let input =
    elements.html([elements.attr("lang", "en")], [
      paragraph("Hello"),
      paragraph("World"),
    ])

  let expected =
    "<!DOCTYPE html><html lang=\"en\"><p>Hello</p><p>World</p></html>"

  render.render_element(input)
  |> should.equal(expected)
}

pub fn render_nested_elements_test() {
  let input =
    elements.html([elements.attr("lang", "en")], [
      elements.head([], [elements.title("Nested")]),
      elements.body([], [
        elements.h1([], [elements.text("Hello")]),
        elements.div([elements.attr("class", "text-2xl")], [
          elements.p([], [elements.text("What a nice library")]),
        ]),
      ]),
    ])

  let expected =
    "<!DOCTYPE html><html lang=\"en\"><head><title>Nested</title></head><body><h1>Hello</h1><div class=\"text-2xl\"><p>What a nice library</p></div></body></html>"

  render.render_element(input)
  |> should.equal(expected)
}
