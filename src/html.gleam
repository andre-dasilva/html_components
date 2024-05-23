import elements.{type Attribute, type Element}

pub fn html(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("html", attrs, children)
}

pub fn head(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("head", attrs, children)
}

pub fn document(
  attrs: List(Attribute),
  head_elements: List(Element),
  body_elements: List(Element),
) -> Element {
  html(attrs, [head([], head_elements), body([], body_elements)])
}

pub fn title(title: String) -> Element {
  elements.element("title", [], [elements.text(title)])
}

pub fn meta(attrs: List(Attribute)) -> Element {
  elements.element_self_closing("meta", attrs)
}

pub fn body(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("body", attrs, children)
}

pub fn p(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("p", attrs, children)
}

pub fn h1(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("h1", attrs, children)
}

pub fn h2(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("h2", attrs, children)
}

pub fn h3(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("h3", attrs, children)
}

pub fn h4(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("h4", attrs, children)
}

pub fn h5(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("h5", attrs, children)
}

pub fn a(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("a", attrs, children)
}

pub fn span(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("span", attrs, children)
}

pub fn div(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("div", attrs, children)
}
