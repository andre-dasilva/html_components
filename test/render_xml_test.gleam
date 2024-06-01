import elements
import gleeunit/should
import render
import xml

pub fn render_simple_xml_test() {
  let book_element = fn(id: String, author: String, title: String) {
    elements.element("book", [elements.attr("id", id)], [
      elements.element("author", [], [elements.escape_text(author)]),
      elements.element("title", [], [elements.escape_text(title)]),
    ])
  }

  let books_element = fn(books) { elements.element("books", [], books) }

  let input =
    books_element([
      book_element("1", "J. K. Rowling", "Philosopher's Stone"),
      book_element("2", "Douglas Adams", "The Hitchhiker's Guide to the Galaxy"),
    ])

  let expected =
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?><books><book id=\"1\"><author>J. K. Rowling</author><title>Philosopher&#x27;s Stone</title></book><book id=\"2\"><author>Douglas Adams</author><title>The Hitchhiker&#x27;s Guide to the Galaxy</title></book></books>"

  render.xml(input)
  |> should.equal(expected)
}

pub fn render_xml_cdata_test() {
  let input =
    elements.element("book", [elements.attr("id", "1")], [
      elements.element("comment", [], [
        elements.cdata(
          "Author said: <quote>The answer to everything is 42</quote>",
        ),
      ]),
    ])

  let expected =
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?><book id=\"1\"><comment><![CDATA[Author said: <quote>The answer to everything is 42</quote>]]></comment></book>"

  render.xml(input)
  |> should.equal(expected)
}

pub fn render_sitemap_test() {
  let input = [
    xml.SitemapUrl(loc: "https://www.example.com/foo", lastmod: "2022-06-04"),
    xml.SitemapUrl(loc: "https://www.example.com/bar", lastmod: "2022-06-05"),
    xml.SitemapUrl(loc: "https://www.example.com/hello", lastmod: "2022-06-10"),
  ]
  let sitemap = xml.sitemap(input)

  let expected =
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?><urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\"><url><loc>https://www.example.com/foo</loc><lastmod>2022-06-04</lastmod></url><url><loc>https://www.example.com/bar</loc><lastmod>2022-06-05</lastmod></url><url><loc>https://www.example.com/hello</loc><lastmod>2022-06-10</lastmod></url></urlset>"

  render.xml(sitemap)
  |> should.equal(expected)
}
