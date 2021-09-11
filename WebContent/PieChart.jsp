    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="com.google.gson.Gson"%>
    <%@ page import="com.google.gson.JsonObject"%>
         <%@ page import="java.sql.*" %>
             <%@ page import="querySet.QuerySet" %>
         
     
    <%
    Gson gsonObj = new Gson();
    Map<Object,Object> map = null;
    List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
    QuerySet qs=new QuerySet();
     ResultSet rs=qs.getPieChartInfo();
     while(rs.next())
     {
    map = new HashMap<Object,Object>(); map.put("label", rs.getString("name")); map.put("y", rs.getInt("revenue")); map.put("exploded", true); list.add(map);
   /* map = new HashMap<Object,Object>(); map.put("label", "Finance"); map.put("y", 20); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "Career"); map.put("y", 18); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "Education"); map.put("y", 15); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "Family"); map.put("y", 5); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "Real Estate"); map.put("y", 7); list.add(map);*/
     }
     
    String dataPoints = gsonObj.toJson(list);
    %>
     
    <!DOCTYPE HTML>
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
    window.onload = function() { 
     
    var chart = new CanvasJS.Chart("chartContainer", {
    	theme: "light2",
    	animationEnabled: true,
    	exportFileName: "New Year Resolutions",
    	exportEnabled: true,
    	title:{
    		text: "Top Categories of New Year's Resolution"
    	},
    	data: [{
    		type: "pie",
    		showInLegend: true,
    		legendText: "{label}",
    		toolTipContent: "{label}: <strong>{y}%</strong>",
    		indexLabel: "{label} {y}%",
    		dataPoints : <%out.print(dataPoints);%>
    	}]
    });
     
    chart.render();
     
    }
    </script>
    </head>
    <body>
    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    </body>
    </html>                              