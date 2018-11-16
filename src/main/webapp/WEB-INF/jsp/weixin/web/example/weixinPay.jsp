<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>微信确认支付</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/static/login/wechat/js/jquery-1.11.3.min.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
	function callpay(appId,timeStamp,nonceStr,package,signType,paySign){
	     WeixinJSBridge.invoke('getBrandWCPayRequest',{
		 	"appId" : appId,
		 	"timeStamp" : timeStamp, 
		 	"nonceStr" : nonceStr, 
		 	"package" : package,
		 	"signType" : signType, 
		 	"paySign" : paySign
			},function(res){
			/* WeixinJSBridge.log(res.err_msg);
            alert(res.err_code + res.err_desc + res.err_msg); */
            if(res.err_msg == "get_brand_wcpay_request:ok"){  
                alert("微信支付成功!");
                window.location.href="${ctx}/weixin_pay/paySuccess.jsp?PayStatus=SUCCESS";
            }else if(res.err_msg == "get_brand_wcpay_request:cancel"){
                alert("用户取消支付!");
                window.location.href="${ctx}/index.jsp";
            }else{
               alert("支付失败!");
               window.location.href="${ctx}/index.jsp";
            }  
		});
	}

</script>
</head>
<body>
交易编号：<input type="text" id="out_trade_no"><br/>
描述：<input type="text" id="body"><br/>
金额：<input type="text" id="total_fee"><br/>
<input type="button" value="微信支付" onclick="pay();">

</body>
<script type="text/javascript">
function pay(){
	var user = "body="+$("#body").val()+"&out_trade_no="+$("#out_trade_no").val()+"&total_fee="+$("#total_fee").val();
	alert(user);
	  $.ajax(
		{
			type:'post',//这里改为get也可以正常执行
			url:'${ctx}/weixin/web/example/getWXPayData.do',
//ContentType没指定将默认为：application/x-www-form-urlencoded
			data:user,
			success:function(data){
				callpay(data.appId,data.timeStamp,data.nonceStr,data.package,data.signType,data.paySign)
				//alert(data.name);
			}
			
		}	
	)
}
</script>
</html>