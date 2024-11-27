---
layout: base_swagger
title: API documentation (main branch)
permalink: /dev/api/main/
lang: "en"
---
<div class="section">
  <div class="container">
    <div class="message is-warning">
      <div class="message-header">Attention, this is the documentation for the main branch</div>
      <div class="message-body">
        <p>The documentation in this page is directly extracted from {% external_link {"text": "RetroMeet's core main branch", "link":"https://github.com/retromeet/core/tree/main"} %} . This means any changes from the previous release are not yet final and can still change.</p>
        <p>If you're working on a client, you might instead want to check the latest release instead.</p>
      </div>
    </div>
  </div>
</div>
<script>
  window.onload = () => {
    window.ui = SwaggerUIBundle({
      spec: {{site.data.openapi_main | jsonify}},
      dom_id: '#swagger-ui',
      tryItOutEnabled: false,
      supportedSubmitMethods: []
    });
  };
</script>
