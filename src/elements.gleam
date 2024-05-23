pub type Attribute {
  Attribute(key: String, value: String)
}

pub type Element {
  Element(tag: String, attrs: List(Attribute), children: List(Element))
  Text(String)
  CData(String)
}

pub fn element(
  tag: String,
  attrs: List(Attribute),
  children: List(Element),
) -> Element {
  Element(tag: tag, attrs: attrs, children: children)
}

pub fn element_self_closing(tag: String, attrs: List(Attribute)) {
  element(tag, attrs, [])
}

pub fn attr(key: String, value: String) -> Attribute {
  Attribute(key, value)
}

pub fn text(value: String) -> Element {
  Text(value)
}

pub fn cdata(value: String) -> Element {
  CData(value)
}
