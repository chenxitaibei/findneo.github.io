{% if page.comments %}
  <div class="comments" id="comments">
    {% if (theme.duoshuo and theme.duoshuo.shortname) or theme.duoshuo_shortname %}
      <div class="ds-thread" data-thread-key="{{ page.path }}"
           data-title="{{ page.title }}" data-url="{{ page.permalink }}">
      </div>
    {% elseif theme.facebook_sdk.enable and theme.facebook_comments_plugin.enable %}
      <div class="fb-comments"
           data-href="{{ page.permalink }}"
           data-numposts="{{ theme.facebook_comments_plugin.num_of_posts }}"
           data-width="{{ theme.facebook_comments_plugin.width }}"
           data-colorscheme="{{ theme.facebook_comments_plugin.scheme }}">
      </div>
    {% elseif theme.vkontakte_api.enable and theme.vkontakte_api.comments %}
      <div id="vk_comments"></div>
    {% elseif theme.disqus.enable %}
      <div id="disqus_thread">
        <noscript>
          Please enable JavaScript to view the
          <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a>
        </noscript>
      </div>
    {% elseif theme.hypercomments_id %}
      <div id="hypercomments_widget"></div>
    {% elseif theme.youyan_uid %}
      <div id="uyan_frame"></div>
    {% elseif theme.livere_uid %}
      <div id="lv-container" data-id="city" data-uid="{{ theme.livere_uid }}"></div>
    {% elseif theme.changyan.appid and theme.changyan.appkey %}
      <div id="SOHUCS"></div>
    {% elseif theme.valine.appid and theme.valine.appkey %}
      <div id="vcomments"></div>
	  
	{% elseif config.gitment.owner and config.gitment.commentrepo and config.gitment.clientid and config.gitment.clientsecret %}
		  <div id="gitmentContainer"></div>
			<link rel="stylesheet" href="https://imsun.github.io/gitment/style/default.css">
			<script src="https://imsun.github.io/gitment/dist/gitment.browser.js"></script>
			<script type="text/javascript">
			var gitment = new Gitment({
			  id: '{{page.title}}',
			  owner: '{{config.gitment.owner}}',
			  repo: '{{config.gitment.commentrepo}}',
			  oauth: {
			  client_id: '{{config.gitment.clientid}}',
			  client_secret: '{{config.gitment.clientsecret}}',
			  },
			})
			gitment.render('gitmentContainer')
			</script>		
    {% endif %}
  </div>
{% endif %}
