<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript" src="/include/jquery.js"></script>
<style type="text/css">
#snsTab {position:fixed;top:140px;width:34px;height:231px;z-index:1000;right:0;}
#snsTab p.sns_twitter {margin-bottom:3px;}
#snsTab .sns_twitterlist {position:fixed;top:140px;margin-left:-355px;width:350px;height:280px;background:#ffffff;}
#snsTab .sns_facebooklist {position:fixed;top:140px;margin-left:-355px;width:350px;height:280px;background:#ffffff;}
</style>
 
<script type="text/javaScript">

$(document).ready(function(){
	$("#sns_tab01").hide();
	$("#sns_tab02").hide();

});
function facebook(){
	$("#sns_tab01").hide();
	$("#sns_tab02").toggle();
}
function twiter(){
	$("#sns_tab02").hide();
	$("#sns_tab01").toggle(); 
}
</script>

<div id="snsTab" >
	
	<p class="sns_twitter"><img src="/images/common/btn_twitter.gif" alt="twitter" usemap="#snsMap1"></p>
	<div id="sns_tab01">
		<div class="sns_twitterlist">
			<script src='http://widgets.twimg.com/j/2/widget.js' charset="utf-8"></script>
			<script type="text/javascript">
				new TWTR.Widget({
			        version: 2,
			         type: 'profile',
			         search: 'profile',// 수정필요
			        interval: 2000,
			      //  title: 'slimQstyle',
			       // subject: '석유공사',
			        width: 350,
			        height: 280,
			        theme: {
			          shell: {
			            background: '#D9D9D9',
			            color: '#ffffff'
			          },
			          tweets: {
			            background: '#ffffff',
			            color: 'gray',
			            links: '#1985b5'
			          }
			        },
			        features: {
			          scrollbar: true,
			          loop: false,
			          live: true,
			          hashtags: true,
			          timestamp: true,
			          avatars: true,
			          toptweets: true,
			          behavior: 'default'
			        }
			      }).render().setUser('KNOC_PR').start(); // 계정요청
			</script>
		</div>  
	</div>

	<p class="sns_facebook"><img src="/images/common/btn_facebook.gif" alt="facebook" usemap="#snsMap2"></p>
	<div id="sns_tab02">
		<div id="fb-root"></div>
		<script type="text/javascript">
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		</script>
		
		<div class="fb-like-box sns_facebooklist" data-href="http://www.facebook.com/KNOC.PR" data-width="350" data-height="280" data-show-faces="true" data-stream="true" data-header="true"></div> 
	</div>
	
	
	<map name="snsMap1" id="snsMap1">
		<area shape="rect" coords="3,4,32,27" href="http://twitter.com/KNOC_PR" target="_blank" title="석유공사 트위터 새창으로 이동" />
		<area shape="rect" coords="3,30,32,111" onclick="twiter();return;" href="#go_twiter" />
	</map> 
	
	<map name="snsMap2" id="snsMap2">
		<area shape="rect" coords="3,3,32,29" href="http://www.facebook.com/KNOC.PR" target="_blank" title="석유공사 페이스북 새창으로 이동" />
		<area shape="rect" coords="3,31,32,110"  onclick="facebook();return;"  href="#go_facebood" />
	</map>
	  
	<div>
</div>
</div>