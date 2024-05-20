import elements.{type HtmlAttribute, type HtmlElement}

pub fn document(
  attrs: List(HtmlAttribute),
  head: List(HtmlElement),
  body: List(HtmlElement),
) -> HtmlElement {
  elements.html(attrs, [elements.head([], head), elements.body([], body)])
}
