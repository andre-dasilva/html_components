import elements
import gleam/list
import gleam/string

fn attributes_to_list(attributes: List(elements.Attribute)) -> String {
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

pub fn escape(value: String) -> String {
  value
  |> string.replace(each: "&", with: "&amp;")
  |> string.replace(each: "<", with: "&lt;")
  |> string.replace(each: ">", with: "&gt;")
  |> string.replace(each: "\"", with: "&quot;")
  |> string.replace(each: "'", with: "&#x27;")
  |> string.replace(each: "/", with: "&#x2F;")
}

pub fn element(el: elements.Element) -> String {
  case el {
    elements.Element(tag, attributes, children) -> {
      let html =
        "<"
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
            |> list.map(element)
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
      escape(value)
    }
    elements.CData(value) -> {
      "<![CDATA["
      |> string.append(value)
      |> string.append("]]>")
    }
  }
}

pub fn html(el: elements.Element) -> String {
  "<!DOCTYPE html>"
  |> string.append(element(el))
}

pub fn xml(el: elements.Element) -> String {
  "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
  |> string.append(element(el))
}
