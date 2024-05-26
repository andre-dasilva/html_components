import elements
import gleam/list

pub type Sitemap {
  SitemapUrl(loc: String, lastmod: String)
}

pub fn sitemap(items: List(Sitemap)) -> elements.Element {
  elements.element(
    "urlset",
    [elements.attr("xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9")],
    list.map(items, fn(item) {
      elements.element("url", [], [
        elements.element("loc", [], [elements.text(item.loc)]),
        elements.element("lastmod", [], [elements.text(item.lastmod)]),
      ])
    }),
  )
}
