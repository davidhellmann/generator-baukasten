<% for (var chunk in htmlWebpackPlugin.files.chunks) { if (!chunk.match(/font/)) { %>
    <script src="<?php bloginfo('template_url'); ?>/<%= htmlWebpackPlugin.files.chunks[chunk].entry %>"></script>
<% }} %>
