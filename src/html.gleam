import elements.{type Attribute, type Element}

pub fn document(
  attrs: List(Attribute),
  head_elements: List(Element),
  body_elements: List(Element),
) -> Element {
  html(attrs, [head([], head_elements), body([], body_elements)])
}

pub fn html(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("html", attrs, children)
}

pub fn head(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("head", attrs, children)
}

pub fn title(title: String) -> Element {
  elements.element("title", [], [elements.escape_text(title)])
}

pub fn meta(attrs: List(Attribute)) -> Element {
  elements.element_self_closing("meta", attrs)
}

pub fn body(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("body", attrs, children)
}

pub fn article(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("article", attrs, children)
}

pub fn aside(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("aside", attrs, children)
}

pub fn header(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("header", attrs, children)
}

pub fn nav(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("nav", attrs, children)
}

pub fn section(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("section", attrs, children)
}

pub fn main(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("main", attrs, children)
}

pub fn figure(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("figure", attrs, children)
}

pub fn figcaption(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("figcaption", attrs, children)
}

pub fn mark(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("mark", attrs, children)
}

pub fn address(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("address", attrs, children)
}

pub fn time(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("time", attrs, children)
}

pub fn progress(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("progress", attrs, children)
}

pub fn blockquote(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("blockquote", attrs, children)
}

pub fn cite(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("cite", attrs, children)
}

pub fn code(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("code", attrs, children)
}

pub fn pre(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("pre", attrs, children)
}

pub fn metre(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("metre", attrs, children)
}

pub fn q(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("q", attrs, children)
}

pub fn video(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("video", attrs, children)
}

pub fn source(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("source", attrs, children)
}

pub fn audio(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("audio", attrs, children)
}

pub fn sub(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("sub", attrs, children)
}

pub fn sup(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("sup", attrs, children)
}

pub fn small(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("small", attrs, children)
}

pub fn i(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("i", attrs, children)
}

pub fn b(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("b", attrs, children)
}

pub fn u(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("u", attrs, children)
}

pub fn s(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("s", attrs, children)
}

pub fn del(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("del", attrs, children)
}

pub fn var(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("var", attrs, children)
}

pub fn link(attrs: List(Attribute)) -> Element {
  elements.element_self_closing("link", attrs)
}

pub fn style(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("style", attrs, children)
}

pub fn script(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("script", attrs, children)
}

pub fn noscript(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("noscript", attrs, children)
}

pub fn area(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("area", attrs, children)
}

pub fn map(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("map", attrs, children)
}

pub fn col(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("col", attrs, children)
}

pub fn colgroup(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("colgroup", attrs, children)
}

pub fn bdo(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("bdo", attrs, children)
}

pub fn datalist(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("datalist", attrs, children)
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

pub fn h6(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("h6", attrs, children)
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

pub fn img(attrs: List(Attribute)) -> Element {
  elements.element_self_closing("img", attrs)
}

pub fn ul(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("ul", attrs, children)
}

pub fn ol(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("ol", attrs, children)
}

pub fn li(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("li", attrs, children)
}

pub fn br(attrs: List(Attribute)) -> Element {
  elements.element_self_closing("hr", attrs)
}

pub fn hr(attrs: List(Attribute)) -> Element {
  elements.element_self_closing("hr", attrs)
}

pub fn table(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("table", attrs, children)
}

pub fn tr(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("tr", attrs, children)
}

pub fn th(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("th", attrs, children)
}

pub fn td(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("td", attrs, children)
}

pub fn form(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("form", attrs, children)
}

pub fn fieldset(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("fieldset", attrs, children)
}

pub fn legend(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("legend", attrs, children)
}

pub fn input(attrs: List(Attribute)) -> Element {
  elements.element_self_closing("input", attrs)
}

pub fn textarea(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("textarea", attrs, children)
}

pub fn select(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("select", attrs, children)
}

pub fn optgroup(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("optgroup", attrs, children)
}

pub fn output(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("output", attrs, children)
}

pub fn object(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("object", attrs, children)
}

pub fn track(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("track", attrs, children)
}

pub fn dialog(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("dialog", attrs, children)
}

pub fn details(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("details", attrs, children)
}

pub fn summary(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("summary", attrs, children)
}

pub fn template(attrs: List(Attribute), children: List(Element)) -> Element {
  elements.element("template", attrs, children)
}

pub fn iframe(attrs: List(Attribute)) -> Element {
  elements.element_self_closing("iframe", attrs)
}
