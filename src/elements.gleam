pub type HtmlAttribute {
  HtmlAttribute(key: String, value: String)
}

pub type HtmlElement {
  HtmlElement(
    tag: String,
    attrs: List(HtmlAttribute),
    children: List(HtmlElement),
  )
  Text(String)
}

pub fn attr(key: String, value: String) -> HtmlAttribute {
  HtmlAttribute(key, value)
}

pub fn text(value: String) -> HtmlElement {
  Text(value)
}

pub fn element(
  tag: String,
  attrs: List(HtmlAttribute),
  children: List(HtmlElement),
) -> HtmlElement {
  HtmlElement(tag: tag, attrs: attrs, children: children)
}

pub fn element_self_closing(tag: String, attrs: List(HtmlAttribute)) {
  element(tag, attrs, [])
}

pub fn html(
  attrs: List(HtmlAttribute),
  children: List(HtmlElement),
) -> HtmlElement {
  element("html", attrs, children)
}

pub fn head(
  attrs: List(HtmlAttribute),
  children: List(HtmlElement),
) -> HtmlElement {
  element("head", attrs, children)
}

pub fn title(title: String) -> HtmlElement {
  element("title", [], [text(title)])
}

pub fn meta(attrs: List(HtmlAttribute)) -> HtmlElement {
  element_self_closing("meta", attrs)
}

pub fn body(
  attrs: List(HtmlAttribute),
  children: List(HtmlElement),
) -> HtmlElement {
  element("body", attrs, children)
}

pub fn p(attrs: List(HtmlAttribute), children: List(HtmlElement)) -> HtmlElement {
  element("p", attrs, children)
}

pub fn h1(
  attrs: List(HtmlAttribute),
  children: List(HtmlElement),
) -> HtmlElement {
  element("h1", attrs, children)
}

pub fn h2(
  attrs: List(HtmlAttribute),
  children: List(HtmlElement),
) -> HtmlElement {
  element("h2", attrs, children)
}

pub fn h3(
  attrs: List(HtmlAttribute),
  children: List(HtmlElement),
) -> HtmlElement {
  element("h3", attrs, children)
}

pub fn h4(
  attrs: List(HtmlAttribute),
  children: List(HtmlElement),
) -> HtmlElement {
  element("h4", attrs, children)
}

pub fn h5(
  attrs: List(HtmlAttribute),
  children: List(HtmlElement),
) -> HtmlElement {
  element("h5", attrs, children)
}

pub fn a(attrs: List(HtmlAttribute), children: List(HtmlElement)) -> HtmlElement {
  element("a", attrs, children)
}

pub fn span(
  attrs: List(HtmlAttribute),
  children: List(HtmlElement),
) -> HtmlElement {
  element("span", attrs, children)
}

pub fn div(
  attrs: List(HtmlAttribute),
  children: List(HtmlElement),
) -> HtmlElement {
  element("div", attrs, children)
}
