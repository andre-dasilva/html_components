import elements
import gleam/list
import gleam/string

fn attributes_to_list(attributes: List(elements.HtmlAttribute)) -> String {
  attributes
  |> list.map(fn(attr) { attr.key <> "=" <> "\"" <> attr.value <> "\"" })
  |> string.join(" ")
}

fn append_if(text, predicate, value_func) -> String {
  case predicate() {
    True -> string.append(text, value_func())
    False -> text
  }
}

pub fn render_element(element: elements.HtmlElement) -> String {
  case element {
    elements.HtmlElement(tag, attributes, children) -> {
      let html =
        "<"
        |> append_if(fn() { tag == "html" }, fn() { "!DOCTYPE html><" })
        |> string.append(tag)
        |> append_if(fn() { list.length(attributes) > 0 }, fn() {
          " " <> attributes_to_list(attributes)
        })

      case children {
        [] -> {
          html
          |> string.append(" />")
        }
        _ -> {
          let html_childen =
            children
            |> list.map(render_element)
            |> string.join("")
            |> string.append("</")
            |> string.append(tag)
            |> string.append(">")

          html
          |> string.append(">")
          |> string.append(html_childen)
        }
      }
    }
    elements.Text(value) -> {
      value
    }
  }
}
