<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/11/27
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试跨域请求</title>
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <!--js中存放当前页面的root路径方便调用-->
    <% String root = request.getContextPath(); %>
    <script type="text/javascript">
        var root = "<%=root%>";
    </script>
    <style>
        .result{
            width:350px;
            height: 97px;
        }
    </style>
</head>
<body>
<input type="button" value="测试ajax jsonp跨域请求" onclick="testJsonP();"/>
<input type="button" value="测试设置cross orgin跨域请求" onclick="testCrossOrigin();"/>
<br>
<textarea id="result" class="result">
   请将test.html拷贝到本地，然后用浏览器打开进行测试，保证是跨域请求。直接在这里测试，并非跨域请求。
</textarea>
<script>

    /**
     * 请求参数
     * */
    var request = {
        number: "2"
    };

    /**
     * 测试JSONP跨域请求
     * */
    function testJsonP() {
        $.ajax({
            url: root + "/testjsonp.do",
            type: "GET",//jsonp只支持GET请求
            data: request,
            dataType: "jsonp",
            jsonp: "callback",//指定查询字符串中回调方法key
            jsonpCallback: "print",//指定查询字符串中回调方法value,例如callback=print
            success: function (data) {//返回的是回调方法的入参
                //alert(data)
            }
        })
    }

    /**
     * 测试设置CrossOrigin跨域请求，此种方式需要后台配合设置header
     * */
    function testCrossOrigin() {
        $.ajax({
            url: root + "/testCrossOrigin.do",
            type: "POST",
            data: request,
            success: function (data) {
                print(data);
            }
        })
    }

    /**
     * 回调函数
     * */
    function print(data) {
        $('#result').text(data);
    }
</script>
</body>
</html>
