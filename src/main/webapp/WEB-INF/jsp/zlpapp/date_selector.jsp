 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>万年历</title>
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="<%=basePath%>static/lshapp/date/css/common.css">
    <link rel="stylesheet" href="<%=basePath%>static/lshapp/date/css/index.css">
    <link rel="stylesheet" href="<%=basePath%>static/lshapp/date/css/swiper-3.3.1.min.css">
    <script src="<%=basePath%>static/lshapp/date/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/lshapp/date/js/swiper-3.3.1.min.js"></script>
</head>

<body style="background-color: white;">


    <!-- 加载ing -->
        <div class="loading loading1 covers" >
            <div class="loading-bj"></div>
            <p>加载中...</p>
        </div>
    <!-- 加载ing END -->
    <section class="out-wrap">
        <div class="header-main">
             <section class="header">
                  <div class="child return"><!-- <i></i> --></div>
                  <div class="child date">
                     <em class="f34" id="ymym">2016年06月</em>
                     <i></i>
                  </div>
             </section>
             <section class="day">
                    <section class="grid clearfix">
                        <div class="day-left clearfix">
                            <h1 id="top_shu">20</h1>
                            <div class="top-contrl">
                                <p><em id="top_week">星期二</em></p>
                                <div><i id="top_yue">八月廿十</i></div>
                                <!-- <p><em id="ymym" class="date">2016年06月</em><span></span></p>
                                <div><i id="top_yue">八月廿十</i><em id="top_week">星期二</em></div> -->
                            </div>
                        </div>
                        <div class="day-right clearfix">
                            <div class="yun">
                                <span class="js_jin">今</span>
                            </div>
                        </div>
                    </section>
             </section>
             <!-- end day -->
        </div>
        <!-- end header -->
        <section class="content">

            <section class="week">
                <ul class="clearfix f28">
                    <li><a href="#">日</a></li>
                    <li><a href="#">一</a></li>
                    <li><a href="#">二</a></li>
                    <li><a href="#">三</a></li>
                    <li><a href="#">四</a></li>
                    <li><a href="#">五</a></li>
                    <li><a href="#">六</a></li>
                </ul>
            </section>
            <section class="calenda">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <table id="now1" class="tables">
                                <tr class="">
                                    <td class=" list"><i>12</i><em>中秋</em></td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide">
                            <table id="now2" class="tables">
                                <tr class="">
                                    <td class=" list"><i>12</i><em>中秋</em></td>
                                    <td class=" list"><i>12</i><em>中秋</em></td>
                                    <td class=" list"><i>12</i><em>中秋</em></td>
                                    <td class=" list"><i>12</i><em>中秋</em></td>
                                    <td class=" list"><i>12</i><em>中秋</em></td>
                                    <td class=" list"><i>12</i><em>中秋</em></td>
                                    <td class=" list"><i>12</i><em>中秋</em></td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide">
                            <table id="now3" class="tables">
                                <tr class="">
                                    <td class="list"><i>12</i><em>中秋</em></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </section>

            <!-- end calenda -->
        </section>
        <!-- end content -->
        <section class="prorup"></section>
        <!-- 弹窗 -->
        <div class="tc"></div>
        <div class="tc-innner">
            <h2>
               <!--  <div class="title-right">
                    <div class="gl zblck active">公历</div>
                    <div class="nl zblck">农历</div>
                </div> -->
                选择日期
            </h2>
            <div class="current-time">
                <i class="i-year">1900</i><i class="i-month">1</i><i class="i-date">1</i>
            </div>
            <div class="swiper-box">
                <i class="i1"></i>
                <i class="i2"></i>
                <i class="i3"></i>
                <div class="swiper-box-li">
                    <div class="swiper-container2 nbxs">
                        <div class="swiper-wrapper year">
                            <div class="swiper-slide">1900年</div>
                            <div class="swiper-slide">1901年</div>
                            <div class="swiper-slide">1902年</div>
                            <div class="swiper-slide">1903年</div>
                            <div class="swiper-slide">1904年</div>
                            <div class="swiper-slide">1905年</div>
                            <div class="swiper-slide">1906年</div>
                            <div class="swiper-slide">1907年</div>
                            <div class="swiper-slide">1908年</div>
                            <div class="swiper-slide">1909年</div>
                            <div class="swiper-slide">1910年</div>
                            <div class="swiper-slide">1911年</div>
                            <div class="swiper-slide">1912年</div>
                            <div class="swiper-slide">1913年</div>
                            <div class="swiper-slide">1914年</div>
                            <div class="swiper-slide">1915年</div>
                            <div class="swiper-slide">1916年</div>
                            <div class="swiper-slide">1917年</div>
                            <div class="swiper-slide">1918年</div>
                            <div class="swiper-slide">1919年</div>
                            <div class="swiper-slide">1920年</div>
                            <div class="swiper-slide">1921年</div>
                            <div class="swiper-slide">1922年</div>
                            <div class="swiper-slide">1923年</div>
                            <div class="swiper-slide">1924年</div>
                            <div class="swiper-slide">1925年</div>
                            <div class="swiper-slide">1926年</div>
                            <div class="swiper-slide">1927年</div>
                            <div class="swiper-slide">1928年</div>
                            <div class="swiper-slide">1929年</div>
                            <div class="swiper-slide">1930年</div>
                            <div class="swiper-slide">1931年</div>
                            <div class="swiper-slide">1932年</div>
                            <div class="swiper-slide">1933年</div>
                            <div class="swiper-slide">1934年</div>
                            <div class="swiper-slide">1935年</div>
                            <div class="swiper-slide">1936年</div>
                            <div class="swiper-slide">1937年</div>
                            <div class="swiper-slide">1938年</div>
                            <div class="swiper-slide">1939年</div>
                            <div class="swiper-slide">1940年</div>
                            <div class="swiper-slide">1941年</div>
                            <div class="swiper-slide">1942年</div>
                            <div class="swiper-slide">1943年</div>
                            <div class="swiper-slide">1944年</div>
                            <div class="swiper-slide">1945年</div>
                            <div class="swiper-slide">1946年</div>
                            <div class="swiper-slide">1947年</div>
                            <div class="swiper-slide">1948年</div>
                            <div class="swiper-slide">1949年</div>
                            <div class="swiper-slide">1950年</div>
                            <div class="swiper-slide">1951年</div>
                            <div class="swiper-slide">1952年</div>
                            <div class="swiper-slide">1953年</div>
                            <div class="swiper-slide">1954年</div>
                            <div class="swiper-slide">1955年</div>
                            <div class="swiper-slide">1956年</div>
                            <div class="swiper-slide">1957年</div>
                            <div class="swiper-slide">1958年</div>
                            <div class="swiper-slide">1959年</div>
                            <div class="swiper-slide">1960年</div>
                            <div class="swiper-slide">1961年</div>
                            <div class="swiper-slide">1962年</div>
                            <div class="swiper-slide">1963年</div>
                            <div class="swiper-slide">1964年</div>
                            <div class="swiper-slide">1965年</div>
                            <div class="swiper-slide">1966年</div>
                            <div class="swiper-slide">1967年</div>
                            <div class="swiper-slide">1968年</div>
                            <div class="swiper-slide">1969年</div>
                            <div class="swiper-slide">1970年</div>
                            <div class="swiper-slide">1971年</div>
                            <div class="swiper-slide">1972年</div>
                            <div class="swiper-slide">1973年</div>
                            <div class="swiper-slide">1974年</div>
                            <div class="swiper-slide">1975年</div>
                            <div class="swiper-slide">1976年</div>
                            <div class="swiper-slide">1977年</div>
                            <div class="swiper-slide">1978年</div>
                            <div class="swiper-slide">1979年</div>
                            <div class="swiper-slide">1980年</div>
                            <div class="swiper-slide">1981年</div>
                            <div class="swiper-slide">1982年</div>
                            <div class="swiper-slide">1983年</div>
                            <div class="swiper-slide">1984年</div>
                            <div class="swiper-slide">1985年</div>
                            <div class="swiper-slide">1986年</div>
                            <div class="swiper-slide">1987年</div>
                            <div class="swiper-slide">1988年</div>
                            <div class="swiper-slide">1989年</div>
                            <div class="swiper-slide">1990年</div>
                            <div class="swiper-slide">1991年</div>
                            <div class="swiper-slide">1992年</div>
                            <div class="swiper-slide">1993年</div>
                            <div class="swiper-slide">1994年</div>
                            <div class="swiper-slide">1995年</div>
                            <div class="swiper-slide">1996年</div>
                            <div class="swiper-slide">1997年</div>
                            <div class="swiper-slide">1998年</div>
                            <div class="swiper-slide">1999年</div>
                            <div class="swiper-slide">2000年</div>
                            <div class="swiper-slide">2001年</div>
                            <div class="swiper-slide">2002年</div>
                            <div class="swiper-slide">2003年</div>
                            <div class="swiper-slide">2004年</div>
                            <div class="swiper-slide">2005年</div>
                            <div class="swiper-slide">2006年</div>
                            <div class="swiper-slide">2007年</div>
                            <div class="swiper-slide">2008年</div>
                            <div class="swiper-slide">2009年</div>
                            <div class="swiper-slide">2010年</div>
                            <div class="swiper-slide">2011年</div>
                            <div class="swiper-slide">2012年</div>
                            <div class="swiper-slide">2013年</div>
                            <div class="swiper-slide">2014年</div>
                            <div class="swiper-slide">2015年</div>
                            <div class="swiper-slide">2016年</div>
                            <div class="swiper-slide">2017年</div>
                            <div class="swiper-slide">2018年</div>
                            <div class="swiper-slide">2019年</div>
                            <div class="swiper-slide">2020年</div>
                            <div class="swiper-slide">2021年</div>
                            <div class="swiper-slide">2022年</div>
                            <div class="swiper-slide">2023年</div>
                            <div class="swiper-slide">2024年</div>
                            <div class="swiper-slide">2025年</div>
                            <div class="swiper-slide">2026年</div>
                            <div class="swiper-slide">2027年</div>
                            <div class="swiper-slide">2028年</div>
                            <div class="swiper-slide">2029年</div>
                            <div class="swiper-slide">2030年</div>
                            <div class="swiper-slide">2031年</div>
                            <div class="swiper-slide">2032年</div>
                            <div class="swiper-slide">2033年</div>
                            <div class="swiper-slide">2034年</div>
                            <div class="swiper-slide">2035年</div>
                            <div class="swiper-slide">2036年</div>
                            <div class="swiper-slide">2037年</div>
                            <div class="swiper-slide">2038年</div>
                            <div class="swiper-slide">2039年</div>
                            <div class="swiper-slide">2040年</div>
                            <div class="swiper-slide">2041年</div>
                            <div class="swiper-slide">2042年</div>
                            <div class="swiper-slide">2043年</div>
                            <div class="swiper-slide">2044年</div>
                            <div class="swiper-slide">2045年</div>
                            <div class="swiper-slide">2046年</div>
                            <div class="swiper-slide">2047年</div>
                            <div class="swiper-slide">2048年</div>
                            <div class="swiper-slide">2049年</div>
                        </div>
                    </div>
                </div>
                <div class="swiper-box-li">
                    <div class="swiper-container3 nbxs">
                        <div class="swiper-wrapper month">
                            <div class="swiper-slide">1月</div>
                            <div class="swiper-slide">2月</div>
                            <div class="swiper-slide">3月</div>
                            <div class="swiper-slide">4月</div>
                            <div class="swiper-slide">5月</div>
                            <div class="swiper-slide">6月</div>
                            <div class="swiper-slide">7月</div>
                            <div class="swiper-slide">8月</div>
                            <div class="swiper-slide">9月</div>
                            <div class="swiper-slide">10月</div>
                            <div class="swiper-slide">11月</div>
                            <div class="swiper-slide">12月</div>
                        </div>
                    </div>
                </div>
                <div class="swiper-box-li">
                    <div class="swiper-container4 nbxs">
                        <div class="swiper-wrapper date">
                            <div class="swiper-slide">1日</div>
                            <div class="swiper-slide">2日</div>
                            <div class="swiper-slide">3日</div>
                            <div class="swiper-slide">4日</div>
                            <div class="swiper-slide">5日</div>
                            <div class="swiper-slide">6日</div>
                            <div class="swiper-slide">7日</div>
                            <div class="swiper-slide">8日</div>
                            <div class="swiper-slide">9日</div>
                            <div class="swiper-slide">10日</div>
                            <div class="swiper-slide">11日</div>
                            <div class="swiper-slide">12日</div>
                            <div class="swiper-slide">13日</div>
                            <div class="swiper-slide">14日</div>
                            <div class="swiper-slide">15日</div>
                            <div class="swiper-slide">16日</div>
                            <div class="swiper-slide">17日</div>
                            <div class="swiper-slide">18日</div>
                            <div class="swiper-slide">19日</div>
                            <div class="swiper-slide">20日</div>
                            <div class="swiper-slide">21日</div>
                            <div class="swiper-slide">22日</div>
                            <div class="swiper-slide">23日</div>
                            <div class="swiper-slide">24日</div>
                            <div class="swiper-slide">25日</div>
                            <div class="swiper-slide">26日</div>
                            <div class="swiper-slide">27日</div>
                            <div class="swiper-slide">28日</div>
                            <div class="swiper-slide">29日</div>
                            <div class="swiper-slide">30日</div>
                            <div class="swiper-slide">31日</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tc-bot">
                <div class="tc-bot-left">回到今天</div>
                <div class="tc-bot-right">确定</div>
                <i></i>
            </div>
        </div>
    </section>
    <script type="text/javascript" src="<%=basePath%>static/lshapp/date/js/common.js"></script>
    <script>

    //全局的年月日，适用于任何时候获取今天的年月日。（很重要）
    var sev_m, sev_y, sev_d, active = 3;
    var mySwiper = new Swiper('.swiper-container', {
        initialSlide: 1,
        loop: true,
        speed: 400,

        followFinger: false,
        prevButton: '.js_prev',
        nextButton: '.js_next',
        onSlideChangeStart: function(swiper) {
            //swiper.params.allowSwipeToPrev = false;
            swiper.lockSwipes();

        },

        onSlideChangeEnd: function(swiper) {

            var nows = $(".swiper-slide-active").find("table").attr("id");
            if (nows == 'now2')
                return;
            nows = parseInt(nows.substr(1, 1));
            //console.log(active,nows);
            if (nows == active)
                return;
            if (active == 4 && nows == 5) {
                var fors = 1;

                sev_m++;
                if (sev_m > 12) {
                    sev_m = 1;
                    sev_y++;
                }
                var nowweak = new Date(sev_y, sev_m - 1, 1).getDay();
                get_first(nowweak, sev_y, sev_m, 0, "d2");

                var lastm = sev_m - 1;
                var lasty = sev_y;
                if (lastm < 1) {
                    lastm = 12;
                    lasty--;
                }

                var nm = sev_m + 1;
                var ny = sev_y;
                if (nm > 12) {
                    nm = 1;
                    ny++;
                }
                var nowweak = new Date(ny, nm - 1, 1).getDay();
                var lastweek = new Date(lasty, lastm - 1, 1).getDay();
                get_first(lastweek, lasty, lastm, 0, "d" + fors);
                get_first(nowweak, ny, nm, 0, "d3");
                $("#ymym").html(sev_y + "年" + sev_m + "月");
                active = 5;
            } else if (active == 2 && nows == 1) {
                var fors = 5;

                var nextweak = new Date(sev_y, sev_m - 1, 1).getDay();
                get_first(nextweak, sev_y, sev_m, 0, "d" + fors);
                sev_m--;
                if (sev_m < 1) {
                    sev_m = 12;
                    sev_y--;
                }
                var nowweak = new Date(sev_y, sev_m - 1, 1).getDay();
                get_first(nowweak, sev_y, sev_m, 0, "d4");

                var nm = sev_m - 1;
                var ny = sev_y;
                if (nm < 1) {
                    nm = 12;
                    ny--;
                }
                var nowweak = new Date(ny, nm - 1, 1).getDay();
                //get_first(nowweak, ny, nm, 0, "d4");
                get_first(nowweak, ny, nm, 0, "d3");
                $("#ymym").html(sev_y + "年" + sev_m + "月");
                active = 1;
            } else if (active == 5 && nows == 3) {
                var fors = 4;

                var lastm = sev_m;
                var lasty = sev_y;

                sev_m++;
                if (sev_m > 12) {
                    sev_m = 1;
                    sev_y++;
                }

                var nm = sev_m + 1;
                var ny = sev_y;
                if (nm > 12) {
                    nm = 1;
                    ny++;
                }
                var nowweak = new Date(ny, nm - 1, 1).getDay();
                get_first(nowweak, ny, nm, 0, "d" + fors);
                var nowweak = new Date(lasty, lastm - 1, 1).getDay();
                get_first(nowweak, lasty, lastm, 0, "d2");
                $("#ymym").html(sev_y + "年" + sev_m + "月");
                active = 3;
            } else if (active == 1 && nows == 3) {
                var fors = 2;

                var lastm = sev_m;
                var lasty = sev_y;

                sev_m--;
                if (sev_m < 1) {
                    sev_m = 12;
                    sev_y--;
                }

                var nm = sev_m - 1;
                var ny = sev_y;
                if (nm < 1) {
                    nm = 12;
                    ny--;
                }
                var nowweak = new Date(ny, nm - 1, 1).getDay();
                get_first(nowweak, ny, nm, 0, "d" + fors);
                var nowweak = new Date(lasty, lastm - 1, 1).getDay();
                get_first(nowweak, lasty, lastm, 0, "d4");
                $("#ymym").html(sev_y + "年" + sev_m + "月");
                active = 3;
            } else if (active == 1 && nows == 5) {
                var fors = 3;

                var lastm = sev_m;
                var lasty = sev_y;

                sev_m++;
                if (sev_m > 12) {
                    sev_m = 1;
                    sev_y++;
                }

                var nm = sev_m + 1;
                var ny = sev_y;
                if (nm > 12) {
                    nm = 1;
                    ny++;
                }
                var nowweak = new Date(ny, nm - 1, 1).getDay();
                get_first(nowweak, ny, nm, 0, "d" + fors);
                $("#ymym").html(sev_y + "年" + sev_m + "月");
                active = 5;
            } else if (active == 5 && nows == 1) {
                var fors = 3;


                sev_m--;
                if (sev_m < 1) {
                    sev_m = 12;
                    sev_y--;
                }
                var lastm = sev_m;
                var lasty = sev_y;

                var nm = sev_m - 1;
                var ny = sev_y;
                if (nm < 1) {
                    nm = 12;
                    ny--;
                }
                var nowweak = new Date(ny, nm - 1, 1).getDay();
                var lastweak = new Date(lasty, sev_m - 1, 1).getDay();
                get_first(nowweak, ny, nm, 0, "d" + fors);
                console.log(lasty,lastm)
                get_first(lastweak, lasty, sev_m, 0, "d4");
                $("#ymym").html(sev_y + "年" + sev_m + "月");
                active = 1;
            } else if (active > nows) {
                var fors = nows - 1;
                if (fors < 1)
                    fors = 5;

                sev_m--;
                if (sev_m < 1) {
                    sev_m = 12;
                    sev_y--;
                }

                var nm = sev_m - 1;
                var ny = sev_y;
                if (nm < 1) {
                    nm = 12;
                    ny--;
                }
                var nowweak = new Date(ny, nm - 1, 1).getDay();
                get_first(nowweak, ny, nm, 0, "d" + fors);
                $("#ymym").html(sev_y + "年" + sev_m + "月");
                active = nows;
            } else if (active < nows) {
                var fors = nows + 1;
                if (fors > 5)
                    fors = 1;

                sev_m++;
                if (sev_m > 12) {
                    sev_m = 1;
                    sev_y++;
                }

                var nm = sev_m + 1;
                var ny = sev_y;
                if (nm > 12) {
                    nm = 1;
                    ny++;
                }
                var nowweak = new Date(ny, nm - 1, 1).getDay();
                get_first(nowweak, ny, nm, 0, "d" + fors);
                $("#ymym").html(sev_y + "年" + sev_m + "月");
                active = nows;
            }
            var trLength = $("#d"+nows).find("tr").length;
            if(trLength==6){
              $(".swiper-container").css("paddingBottom",".45rem");
            }else{
              $(".swiper-container").css("paddingBottom","");

            }
            swiper.unlockSwipes();
        }

    })
    </script>
    <script>
    var yl = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    window.onload = function() {
        $("#now3").attr("id", "d1");
        $("#now1").attr("id", "d2");
        $("#now2").attr("id", "d3");
        $("#now3").attr("id", "d4");
        $("#now1").attr("id", "d5");
        var globledate = new Date();
        var y = globledate.getFullYear();
        var m = globledate.getMonth() + 1;
        var d = globledate.getDate();
        sev_m = m;
        sev_y = y;
        sev_d = d;
        var nowweak = new Date(y, m - 1, 1).getDay();
        if (nowweak == 7) nowweak = 0;
        get_first(nowweak, y, m, d, "d3");
        set_top(0);

        m = m + 1;
        if (m > 12) {
            m = 1;
            y += 1;
        }
        nowweak = new Date(y, m - 1, 1).getDay();
        get_first(nowweak, y, m, 0, "d4");

        m = sev_m - 1;
        if (m < 1) {
            m = 12;
            y = sev_y - 1;
        }
        nowweak = new Date(y, m - 1, 1).getDay();
        get_first(nowweak, y, m, 0, "d2");

        $("#ymym").html(sev_y + "年" + sev_m + "月");

        $(".js_jin").click(function() {
            active = 3;
            var globledate = new Date();
            var y = globledate.getFullYear();
            var m = globledate.getMonth() + 1;
            var d = globledate.getDate();
            sev_m = m;
            sev_y = y;
            sev_d = d;
            var nowweak = new Date(y, m - 1, 1).getDay();
            if (nowweak == 7) nowweak = 0;
            get_first(nowweak, y, m, d, "d3");
            set_top(0);

            m = m + 1;
            if (m > 12) {
                m = 1;
                y += 1;
            }
            nowweak = new Date(y, m - 1, 1).getDay();
            get_first(nowweak, y, m, 0, "d4");

            m = sev_m - 1;
            if (m < 1) {
                m = 12;
                y = sev_y - 1;
            }
            nowweak = new Date(y, m - 1, 1).getDay();
            get_first(nowweak, y, m, 0, "d2");

            $("#ymym").html(sev_y + "年" + sev_m + "月");
            mySwiper.slideTo(2, 500, false);
        });
        mySwiper.unlockSwipes();
    };
    //$(window).ajaxStart(function(){
    //    $(".covers").show();
    //  })
    //  $(window).ajaxStop(function(){
    //    $(".covers").hide();
    //  });
    function jump(yyyy, mm, dd) {
        sev_y = parseInt(yyyy);
        sev_m = parseInt(mm);
        sev_d = parseInt(dd);

        active = 3;
        var globledate = new Date(yyyy, parseInt(mm) - 1, parseInt(dd));
        //var nowweak = globledate.getDay();
        var y = globledate.getFullYear();
        var m = globledate.getMonth() + 1;
        var d = globledate.getDate();
        //console.log("globledate:",y,m,d);

        var sev_m_tmp = m;
        var sev_y_tmp = y;
        var sev_d_tmp = d;
        var nowweak = new Date(y, m - 1, 1).getDay();
        if (nowweak == 7) nowweak = 0;
        get_first(nowweak, y, m, d, "d3");
        //set_top(0);

        m = m + 1;
        if (m > 12) {
            m = 1;
            y += 1;
        }
        nowweak = new Date(y, m - 1, 1).getDay();
        get_first(nowweak, y, m, 0, "d4");

        m = sev_m - 1;
        if (m < 1) {
            m = 12;
            y = sev_y - 1;
        }
        nowweak = new Date(y, m - 1, 1).getDay();
        get_first(nowweak, y, m, 0, "d2");

        $("#ymym").html(sev_y + "年" + sev_m + "月");
        $(".covers").hide();
        mySwiper.slideTo(2, 500, false);
        click_sev();

    }

    function click_sev() {
        $("#d3").find("td").each(function() {
            if ($(this).attr("data_y") == sev_y && $(this).attr("data_m") == sev_m && $(this).attr("data_d") == sev_d) {
                $(this).click();
            }
        });
    }

    function get_first(a, b, c, d, e) {
        var str = '<tr>';
        if ((c - 2) < 0) {
            var ldays = 31;
            var lm = 12;
            var lb = b - 1;
        } else {
            var ldays = yl[c - 2];
            var lm = c - 1;
            var lb = b;
        }

        if (c == 12) {
            var xdays = 31;
            var xm = 1;
            var xb = b + 1;
        } else {
            var xdays = yl[c];
            var xm = c + 1;
            var xb = b;
        }

        if (ldays == 28) {
            if ((lb % 4 == 0 && lb % 100 != 0) || (lb % 100 == 0 && lb % 400 == 0)) {
                ldays = 29;
            }
        }

        if (xdays == 28) {
            if ((xb % 4 == 0 && xb % 100 != 0) || (xb % 100 == 0 && xb % 400 == 0)) {
                xdays = 29;
            }
        }
        var dd;
        if (yl[c - 1] == 28) {
            if ((b % 4 == 0 && b % 100 != 0) || (b % 100 == 0 && b % 400 == 0)) {
                dd = 29;
            } else {
                dd = 28;
            }
        } else {
            dd = yl[c - 1];
        }

        var num = 1;

        for (var i = a; i > 0; i--) {
            var bday = ldays - i + 1;
            var ly = LunarDate.GetLunarDayDetail(lb, lm, bday);
            var jq = getjq(lb, lm, bday);
            if (jq) {
                ly = '<font color="#00b7ec">' + jq;
            }
            var jd = "";
            var hb = lb + "-" + lm + "-" + bday;

            // if (fj.indexOf(hb) >= 0) {
            //     jd = "<span class='fangjia'></span>";
            // }
            // if (sb.indexOf(hb) >= 0) {
            //     jd = "<span class='shangban'></span>";
            // }
            // if (gj.indexOf(hb) >= 0) {
            //     ly = '<font color="#00b7ec">' + gjs[gj.indexOf(hb)];
            // }
            str += ' <td data_y="' + lb + '" data_m="' + lm + '" data_d="' + bday + '" class="list not_this js_up"><i>' + bday + '</i><em>' + ly + '</em>' + jd + '</td>';
            if (num % 7 == 0) {
                str += '</tr><tr>';
            }
            num++;
        }

        for (var i = 1; i <= dd; i++) {
            var bday = ldays - i + 1;
            var ly = LunarDate.GetLunarDayDetail(b, c, i);
            var jq = getjq(b, c, i);
            if (jq) {
                ly = '<font color="#00b7ec">' + jq;
            }
            var jd = "";
            var hb = b + "-" + c + "-" + i;
            if (new Date().getDate() == i && b == new Date().getFullYear() && c == (new Date().getMonth() + 1)) {
                str += ' <td data_y="' + b + '" data_m="' + c + '" data_d="' + i + '" class="list today"><i>' + i + '</i><em>' + ly + '</em>' + jd + '</td>';
            } else {
                str += ' <td data_y="' + b + '" data_m="' + c + '" data_d="' + i + '" class="list"><i>' + i + '</i><em>' + ly + '</em>' + jd + '</td>';
            }

            if (num % 7 == 0) {
                str += '</tr><tr>';
            }
            num++;
        }

         var last = 42 - a - dd;
         if(last<=6){

            for (var i = 1; i <= last; i++) {
                var ly = LunarDate.GetLunarDayDetail(xb, xm, i);
                var jq = getjq(xb, xm, i);
                if (jq) {
                    ly = '<font color="#00b7ec">' + jq;
                }
                var jd = "";
                var hb = xb + "-" + xm + "-" + i;
                str += ' <td data_y="' + xb + '" data_m="' + xm + '" data_d="' + i + '" class="list not_this js_down"><i>' + i + '</i><em>' + ly + '</em>' + jd + '</td>';
                if (num % 7 == 0) {
                    str += '</tr><tr>';
                }
                num++;
            }
        }
        if(str.substring(str.length-4,str.length)=="<tr>"){
            str = str.substring(0,str.length-4);
        }
        document.getElementById(e).innerHTML = str;
        bind_click(e);
    }

    function bind_click(a) {
        $("#" + a).find("td").unbind("click");
        $("#" + a).find("td").each(function() {
            if ($(this).hasClass('not_this')) {
                $(this).click(function() {
                    jump($(this).attr('data_y'), $(this).attr('data_m'), $(this).attr('data_d'));
                });
            } else {
                $(this).click(function() {
                    set_top($(this));/*
                    parent.document.body.style.background= 'green'; */
                    var $body=$(parent.document.body);
                    //alert($body.find("#NICK_NAME").val());
                    $body.find("#solar_birthday").val($(this).attr('data_y')+"-"+$(this).attr('data_m')+"-"+$(this).attr('data_d'))
                    $body.find("#myframe").css("display","none");
                });
            }
        });
    }


    function set_top(a) {
        if (!a) {
            var weeks = ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日'];
            var data = new Date();
            var weekk = weeks[data.getDay() - 1];
            var yue = LunarDate.GetLunarDay(data.getFullYear(), data.getMonth(), data.getDate());
            var shu = data.getDate();
            document.getElementById("top_shu").innerHTML = shu;
            sev_d = parseInt(shu);
            document.getElementById("top_week").innerHTML = weekk;
            document.getElementById("top_yue").innerHTML = yue;
        } else {
            var weeks = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
            var y = a.attr("data_y");
            var m = parseInt(a.attr("data_m")) - 1;
            if (m < 0) m = 11;
            var d = parseInt(a.attr("data_d"));
            var weekk = weeks[new Date(y, m, d).getDay()];
            var ms = parseInt(a.attr("data_m"));
            var yue = LunarDate.GetLunarDay(y, ms, d);
            document.getElementById("top_shu").innerHTML = d;
            sev_d = parseInt(d);
            document.getElementById("top_week").innerHTML = weekk;
            document.getElementById("top_yue").innerHTML = yue;
            $(".xuanzhong").removeClass('xuanzhong');
            a.addClass("xuanzhong");
        }
    }

    var LunarDate = {
        madd: new Array(0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334),
        HsString: '甲乙丙丁戊己庚辛壬癸',
        EbString: '子丑寅卯辰巳午未申酉戌亥',
        NumString: "一二三四五六七八九十",
        MonString: "正二三四五六七八九十冬腊",
        CalendarData: new Array(0xA4B, 0x5164B, 0x6A5, 0x6D4, 0x415B5, 0x2B6, 0x957, 0x2092F, 0x497, 0x60C96, 0xD4A, 0xEA5, 0x50DA9, 0x5AD, 0x2B6, 0x3126E, 0x92E, 0x7192D, 0xC95, 0xD4A, 0x61B4A, 0xB55, 0x56A, 0x4155B, 0x25D, 0x92D, 0x2192B, 0xA95, 0x71695, 0x6CA, 0xB55, 0x50AB5, 0x4DA, 0xA5B, 0x30A57, 0x52B, 0x8152A, 0xE95, 0x6AA, 0x615AA, 0xAB5, 0x4B6, 0x414AE, 0xA57, 0x526, 0x31D26, 0xD95, 0x70B55, 0x56A, 0x96D, 0x5095D, 0x4AD, 0xA4D, 0x41A4D, 0xD25, 0x81AA5, 0xB54, 0xB6A, 0x612DA, 0x95B, 0x49B, 0x41497, 0xA4B, 0xA164B, 0x6A5, 0x6D4, 0x615B4, 0xAB6, 0x957, 0x5092F, 0x497, 0x64B, 0x30D4A, 0xEA5, 0x80D65, 0x5AC, 0xAB6, 0x5126D, 0x92E, 0xC96, 0x41A95, 0xD4A, 0xDA5, 0x20B55, 0x56A, 0x7155B, 0x25D, 0x92D, 0x5192B, 0xA95, 0xB4A, 0x416AA, 0xAD5, 0x90AB5, 0x4BA, 0xA5B, 0x60A57, 0x52B, 0xA93, 0x40E95),
        Year: null,
        Month: null,
        Day: null,
        TheDate: null,
        GetBit: function(m, n) {
            return (m >> n) & 1;
        },
        e2c: function() {
            this.TheDate = (arguments.length != 3) ? new Date() : new Date(arguments[0], arguments[1], arguments[2]);
            var total, m, n, k;
            var isEnd = false;
            var tmp = this.TheDate.getFullYear();
            total = (tmp - 1921) * 365 + Math.floor((tmp - 1921) / 4) + this.madd[this.TheDate.getMonth()] + this.TheDate.getDate() - 38;
            if (this.TheDate.getYear() % 4 == 0 && this.TheDate.getMonth() > 1) {
                total++;
            }
            for (m = 0;; m++) {
                k = (this.CalendarData[m] < 0xfff) ? 11 : 12;
                for (n = k; n >= 0; n--) {
                    if (total <= 29 + this.GetBit(this.CalendarData[m], n)) {
                        isEnd = true;
                        break;
                    }
                    total = total - 29 - this.GetBit(this.CalendarData[m], n);
                }
                if (isEnd)
                    break;
            }
            this.Year = 1921 + m;
            this.Month = k - n + 1;
            this.Day = total;
            if (k == 12) {
                if (this.Month == Math.floor(this.CalendarData[m] / 0x10000) + 1) {
                    this.Month = 1 - this.Month;
                }
                if (this.Month > Math.floor(this.CalendarData[m] / 0x10000) + 1) {
                    this.Month--;
                }
            }
        },
        GetcDateString: function(tip) {
            if (tip == 1) {
                var ts = (this.Day < 11) ? "初" : ((this.Day < 20) ? "十" : ((this.Day < 30) ? "廿" : "三十"));
                if (this.Day % 10 != 0 || this.Day == 10) {
                    ts += this.NumString.charAt((this.Day - 1) % 10);
                }
                return ts;
            }
            var tmp = "";
            // tmp += this.HsString.charAt((this.Year - 4) % 10);
            // tmp += this.EbString.charAt((this.Year - 4) % 12);
            // tmp += "年 ";
            if (this.Month < 1) {
                //tmp += "(闰)";
                tmp += this.MonString.charAt(-this.Month - 1);
            } else {
                tmp += this.MonString.charAt(this.Month - 1);
            }
            tmp += "月";
            tmp += (this.Day < 11) ? "初" : ((this.Day < 20) ? "十" : ((this.Day < 30) ? "廿" : "三十"));
            if (this.Day % 10 != 0 || this.Day == 10) {
                tmp += this.NumString.charAt((this.Day - 1) % 10);
            }
            return tmp;
        },
        GetLunarDay: function(solarYear, solarMonth, solarDay) {
            if (solarYear < 1921 || solarYear > 2020) {
                return "";
            } else {
                solarMonth = (parseInt(solarMonth) > 0) ? (solarMonth - 1) : 11;
                this.e2c(solarYear, solarMonth, solarDay);
                return this.GetcDateString(0);
            }
        },
        GetLunarDayDetail: function(solarYear, solarMonth, solarDay) {
            if (solarYear < 1921 || solarYear > 2020) {
                return "";
            } else {
                solarMonth = (parseInt(solarMonth) > 0) ? (solarMonth - 1) : 11;
                this.e2c(solarYear, solarMonth, solarDay);
                return this.GetcDateString(1);
            }
        }
    };

    function getjq(yyyy, mm, dd) {
        if(yyyy==2016&&mm==12&&dd==7){
            return "大雪";
        }
        if(yyyy==2016&&mm==12&&dd==6){
            return "";
        }
        mm = mm - 1;
        var sTermInfo = new Array(0, 21208, 42467, 63836, 85337, 107014, 128867, 150921, 173149, 195551, 218072, 240693, 263343, 285989, 308563, 331033, 353350, 375494, 397447, 419210, 440795, 462224, 483532, 504758);
        var solarTerm = new Array("小寒", "大寒", "立春", "雨水", "惊蛰", "春分", "清明", "谷雨", "立夏", "小满", "芒种", "夏至", "小暑", "大暑", "立秋", "处暑", "白露", "秋分", "寒露", "霜降", "立冬", "小雪", "大雪", "冬至");
        var tmp1 = new Date((31556925974.7 * (yyyy - 1900) + sTermInfo[mm * 2 + 1] * 60000) + Date.UTC(1900, 0, 6, 2, 5));
        var tmp2 = tmp1.getUTCDate();
        var solarTerms = "";
        if (tmp2 == dd)
            solarTerms = solarTerm[mm * 2 + 1];
        tmp1 = new Date((31556925974.7 * (yyyy - 1900) + sTermInfo[mm * 2] * 60000) + Date.UTC(1900, 0, 6, 2, 5));
        tmp2 = tmp1.getUTCDate();
        if (tmp2 == dd)
            solarTerms = solarTerm[mm * 2];
        return solarTerms;
    }

    $(function() {

        $(".prorup").on("click", function() {
            $(".prorup").hide();
            $(".jie").hide();
            $(".layer").hide();
        });

        $(".jqclass").click(function() {
            var riziss = $(this).attr('data');
            var srt = riziss.split("-");
            $(".prorup").hide();
            $(".layer").hide();
            jump(srt[0], srt[1], srt[2]);
            $(".jie").hide();
        });

    });

    $('.date').on('click', function() {

        $('.tc').show();
        $('.tc-innner').show();

        tc();

    });

    var e = 1;

    function tc() {
        var b, c, d;
        var myDate = new Date();

        if (e == 0) {
            b = myDate.getFullYear() - 1900;
            c = myDate.getMonth();
            d = myDate.getDate()-1;

        } else {
            b = sev_y - 1900;
            c = sev_m - 1;
            d = sev_d - 1;


        }
        e = 1;
        var mySwiper = new Swiper('.swiper-container2', {
            direction: 'vertical',
            initialSlide: b,
            slidesPerView: 'auto',
            roundLengths: true,
            centeredSlides: true,

            watchSlidesProgress: true,
            watchSlidesVisibility: true,

            freeMode: true,
            freeModeMomentumRatio: 1,
            freeModeSticky: true,
            onTouchMove: function(swiper) {
                var b1 = $('.year').children('.swiper-slide-active').html();
                $('.i-year').html(b1);
            },
            onSlideChangeEnd: function(swiper) {
                var b1 = $('.year').children('.swiper-slide-active').html();
                $('.i-year').html(b1);
            },


        });
        var mySwiper = new Swiper('.swiper-container3', {
            direction: 'vertical',
            initialSlide: c,
            slidesPerView: 'auto',
            roundLengths: true,
            centeredSlides: true,

            watchSlidesProgress: true,
            watchSlidesVisibility: true,

            freeMode: true,
            freeModeMomentumRatio: 1,
            freeModeSticky: true,
            onTouchMove: function(swiper) {
                var b1 = $('.month').children('.swiper-slide-active').html();
                $('.i-month').html(b1);
            },
            onSlideChangeEnd: function(swiper) {
                var b1 = $('.month').children('.swiper-slide-active').html();
                $('.i-month').html(b1);
            },


        });
        var mySwiper = new Swiper('.swiper-container4', {
            direction: 'vertical',
            initialSlide: d,
            slidesPerView: 'auto',
            roundLengths: true,
            centeredSlides: true,

            watchSlidesProgress: true,
            watchSlidesVisibility: true,

            freeMode: true,
            freeModeMomentumRatio: 1,
            freeModeSticky: true,
            onTouchMove: function(swiper) {
                var b1 = $('.date').children('.swiper-slide-active').html();
                $('.i-date').html(b1);
            },
            onSlideChangeEnd: function(swiper) {
                var b1 = $('.date').children('.swiper-slide-active').html();
                $('.i-date').html(b1);
            },

        });
    };

    $('.tc-bot-left').click(function() {
        e = 0;
        tc();
    });
    $('.tc-bot-right').click(function() {
        $('.tc').hide();
        $('.tc-innner').hide();
        var yyyy = parseInt($('.year').children('.swiper-slide-active').html());
        var mm = parseInt($('.month').children('.swiper-slide-active').html());
        var dd = parseInt($('.date').children('.swiper-slide-active').html());
        if (mm != sev_m || yyyy != sev_y || dd != sev_d) {
            jump(yyyy, mm, dd);

     };



    });
    $(".tc").on("click",function(){
        $(".tc-innner").hide();
        $(this).hide();

    });
    </script>
</body>

</html>
