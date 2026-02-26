<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
                xmlns:html="http://www.w3.org/TR/REC-html40"
                xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>XML Sitemap - Skejasam Paintball</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <style type="text/css">
          body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 14px;
            color: #333;
            margin: 0;
            padding: 0;
            background-color: #f4f7f6;
          }
          #header {
            background-color: #1a1a2e;
            color: #fff;
            padding: 20px 30px;
            border-bottom: 5px solid #FF5722;
          }
          #header h1 {
            margin: 0;
            font-size: 24px;
          }
          #header p {
            margin: 5px 0 0;
            font-size: 14px;
            color: #d1d1e0;
          }
          #content {
            padding: 30px;
            max-width: 1000px;
            margin: 0 auto;
          }
          .info {
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            margin-bottom: 20px;
          }
          table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
          }
          th {
            background-color: #FF5722;
            color: #fff;
            text-align: left;
            padding: 15px;
            font-weight: 600;
          }
          td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
          }
          tr:last-child td {
            border-bottom: none;
          }
          tr:hover {
            background-color: #fcfcfc;
          }
          a {
            color: #0066cc;
            text-decoration: none;
            font-weight: 500;
          }
          a:hover {
            text-decoration: underline;
            color: #004c99;
          }
          .row-odd {
            background-color: #fafafa;
          }
          .footer {
            text-align: center;
            padding: 20px;
            font-size: 12px;
            color: #888;
            margin-top: 20px;
          }
        </style>
      </head>
      <body>
        <div id="header">
          <h1>Skejasam Paintball - XML Sitemap</h1>
          <p>Ini adalah peta situs XML (Sitemap) yang ditujukan agar mesin pencari (seperti Google, Bing, Yahoo) lebih mudah mengindeks seluruh halaman website dengan cepat dan akurat.</p>
        </div>
        <div id="content">
          <div class="info">
            <p>Sitemap ini berisi <strong><xsl:value-of select="count(sitemap:urlset/sitemap:url)"/></strong> URL (Halaman Utama dan Blog Artikel).</p>
          </div>
          <table>
            <thead>
              <tr>
                <th>URL Halaman / Tautan</th>
                <th>Prioritas (Priority)</th>
                <th>Frekuensi Perubahan (ChangeFreq)</th>
                <th>Terakhir Dimodifikasi (LastMod)</th>
              </tr>
            </thead>
            <tbody>
              <xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"/>
              <xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
              <xsl:for-each select="sitemap:urlset/sitemap:url">
                <tr>
                  xsl:if test="position() mod 2 != 1">
                    <xsl:attribute  name="class">row-odd</xsl:attribute>
                  </xsl:if>
                  <td>
                    <xsl:variable name="itemURL">
                      <xsl:value-of select="sitemap:loc"/>
                    </xsl:variable>
                    <a href="{$itemURL}" target="_blank">
                      <xsl:value-of select="sitemap:loc"/>
                    </a>
                  </td>
                  <td>
                    <xsl:value-of select="sitemap:priority"/>
                  </td>
                  <td>
                    <xsl:value-of select="sitemap:changefreq"/>
                  </td>
                  <td>
                    <xsl:value-of select="concat(substring(sitemap:lastmod,0,11),concat(' ', substring(sitemap:lastmod,12,5)),concat(' ', substring(sitemap:lastmod,20,6)))"/>
                    <xsl:value-of select="sitemap:lastmod"/>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
          <div class="footer">
            <p>Dihasilkan secara dinamis untuk mengoptimalkan mesin pencari (SEO). Hak Cipta dilindungi. Skejasam Paintball Otomatisasi XML 2026.</p>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
