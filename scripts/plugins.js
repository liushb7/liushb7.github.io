hexo.extend.filter.register('theme_inject', function(injects) {
    
    if (hexo.theme.config.aplayer && hexo.theme.config.aplayer.enabled) {
        injects.head.file('aplayer', 'source/_data/APlayer.swig', {aplayer: hexo.theme.config.aplayer});
    }
    
    
});