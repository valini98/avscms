{if $video.embed_code != ''}
    <div class="video-embedded">
        {$video.embed_code}
    </div>
{else}
    <!-- Video player container -->
    <div class="video-container" id="videoPlayer" style="display: none;"> <!-- Sembunyikan video player secara default -->
        <video id="video" class="video-js vjs-16-9 vjs-big-play-centered vjs-sublime-skin" preload="auto" controls="true" playsinline webkit-playsinline poster="{insert name=thumb_path vid=$video.VID}/default.jpg" data-setup='{
          "autoplay": {if $player.autoplay}true{else}false{/if}{if $vast_vpaid && $player.vast_vpaid_adv},
          "plugins": {
          "vastClient": {
            "adTagUrl": "{$vast_vpaid.adtagurl}",
            "adCancelTimeout": {$vast_vpaid.adscanceltimeout},
            "playAdAlways": true,        
            "adsEnabled": {if $player.vast_vpaid_adv}true{else}false{/if}
            }
          }
        {/if}}'>
        <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
        </video>      
    </div>
    
    <!-- AdBlock warning message -->
    <div id="adblockMessage" style="text-align: center; margin-top: 20px; display: none;">
        <h3>AdBlock Detected</h3>
        <p>Please disable your AdBlock to watch this video.</p>
    </div>
{/if}

{literal}
<script type="text/javascript">
  window.onload = function() {
      var adBlockDetector = document.createElement('div');
      adBlockDetector.className = 'ad-body mt-3';
      document.body.appendChild(adBlockDetector);
      setTimeout(function() {
          if (adBlockDetector.offsetHeight === 0) {
              document.getElementById('videoPlayer').style.display = 'none';
              document.getElementById('adblockMessage').style.display = 'block';
          } else {
              document.getElementById('videoPlayer').style.display = 'block';
              document.getElementById('adblockMessage').style.display = 'none';
          }
          adBlockDetector.remove();
      }, 100);
  };
</script>
{/literal}
