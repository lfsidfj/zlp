<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/JavaScript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script type="text/javascript">
/* alert('${sign.appid}');
alert('${sign.timestamp}');
alert('${sign.noncestr}');
alert('${sign.signature}');
alert('${shareUrl}'); */
wx.config({
    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: '${sign.appid}', // 必填，公众号的唯一标识
    timestamp: '${sign.timestamp}', // 必填，生成签名的时间戳
    nonceStr: '${sign.noncestr}', // 必填，生成签名的随机串
    signature: '${sign.signature}',// 必填，签名，见附录1
    jsApiList: ['onMenuShareTimeline','onMenuShareQQ','onMenuShareQZone','onMenuShareAppMessage','getLocation'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});

wx.ready(function(){

	// 分享到朋友圈
	wx.onMenuShareTimeline({
        title: 'Spiderman', // 分享标题
        link: 'http://sport.liecaizhijia.com/spiderman/weixin/web/example/myfistview.do?share_id=${share_id}', // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
        imgUrl: 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1765474568,392718820&fm=27&gp=0.jpg', // 分享图标
        success: function (res) {
            alert('分享成功');
        },
        cancel: function (res) {
          alert('你没有分享');
        },
        fail: function (res) {
          alert(JSON.stringify(res));
        }
    });
	wx.onMenuShareAppMessage({
        title: 'Spiderman',
        desc: 'Spiderman',
        link: 'http://sport.liecaizhijia.com/spiderman/weixin/web/example/myfistview.do?share_id=${share_id}',
        imgUrl: 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1765474568,392718820&fm=27&gp=0.jpg',
        trigger: function (res) {
          // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
        },
        success: function (res) {
            alert('分享给朋友成功');
        },
        cancel: function (res) {
          alert('你没有分享给朋友');
        },
        fail: function (res) {
          alert(JSON.stringify(res));
        }
      });
	wx.getLocation({
		type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
		success: function (res) {
		var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
		var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
		var speed = res.speed; // 速度，以米/每秒计
		var accuracy = res.accuracy; // 位置精度
		alert(latitude+","+longitude);
		}
		});
});

wx.error(function(res){
    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
});
</script>