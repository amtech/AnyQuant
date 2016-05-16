<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <title>AnyQuant--大盘指数</title>
    <meta name="description" content="AnyQuant是一个在线电话交易平台"/>
    <meta name="keyword" content="AnyQuant,股票,电话交易"/>
    <meta name="author" content="Ultraviolet"/>
    <link href="/images/icon.png" rel="icon"/>
    <link href="style/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="style/marketStyle.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/tab.js"></script>


    <%--柱状图引包--%>
    <script type="text/javascript" src="js/jquery.jqplot.min.js"></script>
    <script type="text/javascript" src="js/jqplot.barRenderer.min.js"></script>
    <script type="text/javascript" src="js/jqplot.categoryAxisRenderer.min.js"></script>
    <script type="text/javascript" src="js/jqplot.pointLabels.min.js"></script>

    <%--折线图引包--%>
    <script type="text/javascript" src="js/jqplot.dateAxisRenderer.min.js"></script>
    <script type="text/javascript" src="js/jqplot.logAxisRenderer.min.js"></script>
    <script type="text/javascript" src="js/jqplot.canvasTextRenderer.min.js"></script>
    <script type="text/javascript" src="js/jqplot.canvasAxisTickRenderer.min.js"></script>
    <script type="text/javascript" src="js/jqplot.ohlcRenderer.min.js"></script>
    <script type="text/javascript" src="js/jqplot.cursor.min.js"></script>
    <link rel="stylesheet" type="text/css" hrf="style/jquery.jqplot.min.css"/>


    <%
        long volume[] = new long[0];
        String date[] = new String[0];
        double high[] = new double[0];
        double adj_price[] = new double[0];
        double low[] = new double[0];
        double close[] = new double[0];
        double open[] = new double[0];
        double increase_decreaseRate[] = new double[0];
        double increase_decreaseNum[] = new double[0];
        if (request.getAttribute("volume") == null) {
            System.out.println("哎哟喂空的欸！volume");
        } else if (request.getAttribute("date") == null) {
            System.out.println("哎哟喂空的欸！date");
        } else {
            volume = (long[]) request.getAttribute("volume");
            date = (String[]) request.getAttribute("date");
            high = (double[]) request.getAttribute("high");
            adj_price = (double[]) request.getAttribute("adj_price");
            low = (double[]) request.getAttribute("low");
            close = (double[]) request.getAttribute("close");
            increase_decreaseRate = (double[]) request.getAttribute("open");
            increase_decreaseNum = (double[]) request.getAttribute("increase_decreaseRate");
//             System.out.println(volume[0]+"aiyowei");
//             System.out.println(date[0]+"yoyoyo");
        }
    %>


    <script type="text/javascript">

//        zooming.html
        function lineChart() {

            var line1 = [[]];
            <!-- data和volume是request中属性的名字-->
            <c:forEach items="${date}" var="date1" varStatus="loop">
            var date1 = "${date1}"
            var quantity = "${volume[loop.count-1]}"
            line1[0].push([date1, quantity]);
            </c:forEach>
            //alert(line1);


            var plot1 = $.jqplot('chart', line1, {
                title: 'Google, Inc.',
                series: [{
                    label: 'Google, Inc.',
                    neighborThreshold: -1
                }],
                axes: {
                    xaxis: {
                        renderer: $.jqplot.DateAxisRenderer,
                        tickRenderer: $.jqplot.CanvasAxisTickRenderer,
                        tickOptions: {
                            angle: -30
                        }
                    },
                    yaxis: {
                        renderer: $.jqplot.LogAxisRenderer,
                        tickOptions: {prefix: '$'}
                    }
                },
                cursor: {
                    show: true,
                    zoom: true
                }
            });
        }

    </script>
    <link href="style/jquery.jqplot.css" rel="stylesheet" type="text/css"/>
    <link href="style/jquery.jqplot.min.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<jsp:include page="navBar.jsp"/>
<div class="row">
    <div class="col-md-2 vertical-nav">
        <div class="container-fluid">
            <div class="market-index-list">
                <ul class="nav nav-pills nav-stacked market-index-list">
                    <li role="presentation" class="active"><a href="#">上证指数</a></li>
                    <li role="presentation"><a href="#">深证成指</a></li>
                    <li role="presentation"><a href="#">沪深300</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-md-9 content">
        <div class="row latest-data"><!--最新数据-->
            <div class="col-md-2 name-code">
                <P class="text-center name">沪深300</P>
                <p class="text-center code">（1B0300）</p>
            </div>
            <div class="col-md-4">
                <div class="inc-dec">
                    <p class="text-left price">
                        366.68
                        <small>
                            <small>
                                <small>-6.16 (-1.65%)</small>
                            </small>
                        </small>
                    </p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="data">
                    <div class="data-top"><%--顶部数据，包含今开、最高、成交量--%>
                        <div class="col-md-4">
                            <p class="text-left">今开：372.72</p>
                        </div>
                        <div class="col-md-4">
                            <p class="text-left">最高：373.64</p>
                        </div>
                        <div class="col-md-4">
                            <P class="text-left">成交量：60.03万手</P>
                        </div>
                    </div>
                    <div class="data-bottom"><%--底部数据，包含昨收、最低、成交额--%>
                        <div class="col-md-4">
                            <p class="text-left">昨收：372.84</p>
                        </div>
                        <div class="col-md-4">
                            <p class="text-left">最低：366.50</p>
                        </div>
                        <div class="col-md-4">
                            <P class="text-left">成交额：4.92亿</P>
                        </div>
                    </div>
                </div>
                <%--data--%>
            </div>
        </div>
        <%-- latest-data --%>
        <div class="chart-list">
            <%--<ul class="nav nav-tabs chart-tabs">--%>
            <%--<li role="presentation" class="active"><a href="javascript:void(0)">分时图</a></li>--%>
            <%--<li role="presentation"><a href="javascript:void(0)">K线图</a></li>--%>
            <%--<li role="presentation"><a href="javascript:void(0)">折线图</a></li>--%>
            <%--</ul>--%>
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active">
                    <a href="#time-series" aria-controls="time-series" role="tab" data-toggle="tab">分时图</a>
                </li>
                <li role="presentation">
                    <a href="#broken-line" aria-controls="broken-line" role="tab" data-toggle="tab"
                       onclick="lineChart()">折线图</a>
                </li>
                <li role="presentation">
                    <a href="#daily_k" aria-controls="daily_k" role="tab" data-toggle="tab">日K线</a>
                </li>
                <li role="presentation">
                    <a href="#weekly_k" aria-controls="weekly_k" role="tab" data-toggle="tab">周K线</a>
                </li>
                <li role="presentation">
                    <a href="#monthly_k" aria-controls="monthly_k" role="tab" data-toggle="tab">月K线</a>
                </li>
            </ul>


            <div class="tab-content">
                <%--<div role="tabpanel" class="tab-pane active" id="time-series">--%>
                <%--<img src="<%=graphURL_1%>">--%>
                <%--</div>--%>
                <%--<div role="tabpanel" class="tab-pane" id="broken-line">--%>
                <%--<img src="<%=graphURL_2%>">--%>
                <%--</div>--%>
                <%--<div role="tabpanel" class="tab-pane" id="daily_k">--%>
                <%--<img src="<%=graphURL_3%>">--%>
                <%--</div>--%>
                <div role="tabpanel" class="tab-pane" id="weekly_k">test4</div>
                <div role="tabpanel" class="tab-pane" id="monthly_k">test5</div>
            </div>
        </div>
    </div>
    content
    <div class="col-md-1">

    </div>

    <div id="chart" style="width: 800px; height: 500px;"></div>

    <footer class=bs-docs-footer role=contentinfo>
        <jsp:include page="footer.jsp"/>
    </footer>
    </div>
</body>

</html>