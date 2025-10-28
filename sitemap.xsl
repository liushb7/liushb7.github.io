<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>网站地图 - <xsl:value-of select="urlset/url[1]/loc"/></title>
        <meta charset="UTF-8"/>
        <style>
          body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; margin: 0; padding: 20px; background: #f5f5f5; }
          .container { max-width: 1200px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
          h1 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
          .stats { background: #f8f9fa; padding: 15px; border-radius: 5px; margin: 20px 0; }
          table { width: 100%; border-collapse: collapse; margin: 20px 0; }
          th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
          th { background: #3498db; color: white; }
          tr:hover { background: #f8f9fa; }
          a { color: #3498db; text-decoration: none; }
          a:hover { text-decoration: underline; }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>🗺️ 网站地图</h1>
          <div class="stats">
            <strong>总计URL数量:</strong> <xsl:value-of select="count(urlset/url)"/> |
            <strong>最后更新:</strong> <xsl:value-of select="urlset/url[1]/lastmod"/>
          </div>
          <table>
            <thead>
              <tr>
                <th>URL地址</th>
                <th>最后修改</th>
                <th>更新频率</th>
                <th>优先级</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="urlset/url">
                <tr>
                  <td><a href="{loc}"><xsl:value-of select="loc"/></a></td>
                  <td><xsl:value-of select="lastmod"/></td>
                  <td><xsl:value-of select="changefreq"/></td>
                  <td><xsl:value-of select="priority"/></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>