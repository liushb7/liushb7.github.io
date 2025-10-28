const fs = require('fs');
const path = require('path');

hexo.extend.filter.register('after_generate', function() {
  // 读取sitemap.xml文件
  const sitemapPath = path.join(hexo.public_dir, 'sitemap.xml');
  
  if (fs.existsSync(sitemapPath)) {
    let content = fs.readFileSync(sitemapPath, 'utf8');
    
    // 添加XSLT样式表引用（如果还没有的话）
    if (!content.includes('xml-stylesheet')) {
      content = content.replace(
        '<?xml version="1.0" encoding="UTF-8"?>',
        '<?xml version="1.0" encoding="UTF-8"?>\n<?xml-stylesheet type="text/xsl" href="/sitemap.xsl"?>'
      );
      
      fs.writeFileSync(sitemapPath, content, 'utf8');
      console.log('✅ Sitemap样式已注入');
    }
  }
});