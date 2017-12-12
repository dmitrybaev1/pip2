<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="pointsBean" class="points.Points" scope="session"/>
<html>

<head>
  <meta charset="utf-8">
  <title>Lab 2</title>
  <style>
    *
    {
      position: relative;
      margin: 0;
    }

    table.layout
    {
      table-layout: fixed;
      width: 100%;
      height: 100%;
      border-spacing: 0px;
    }
    table#bodylayout
    {
      width: 100%;
      padding: 2%;
      border-spacing: 0px;
    }
    table.calculation
    {
      width: 100%;
      border: 1px solid black;
      border-collapse: collapse;
      table-layout:fixed;
    }
    table.calculation td, table.calculation th
    {
      text-align:center;
      vertical-align: middle;
      padding: 1%;
      border: 1px solid black;
      overflow: auto;
    }
    tr#header
    {
      height: 10%;
      min-height: 10%;
    }
    tr.body
    {
    }
    td
    {
      padding: 0;
      vertical-align: top;
    }

    td.navigationpanel
    {
      height: 10%;
      vertical-align: middle;
      background-color: #55585D;
    }
    td.sidespacer
    {
      width: 20%;
      background-color: #E3E8EE;
    }
    td.body
    {
      background-color: #FFFFFF;
    }
    p.navigationpanel
    {
      display: inline;
      margin-right: 3%;
      font-family: 'Play';
      font-size: 150%;
      color: white;
    }
    p.caption
    {
      text-align: center;
      font-size: x-large;
      font-weight: 600;
    }
    #caption{
      text-align: center;
      font-size: x-large;
      font-weight: 600;
    }
    a
    {
      color: inherit;
      text-decoration: none;
    }
    #canvasblock{
      text-align: center;
    }
  </style>
  <script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
  <script type="text/javascript">
      function checkInput()
      {
          var y = document.form.y.value;
          if (!isFinite(y) || y >= 5 || y <= -3)
          {
              alert("'y' must be from -3 to 5!");
              document.form.y.focus();
              return false;
          }
          if(!($('.myCheckbox').is(':checked')))
          {
              alert('Input x!');
              return false;
          }
          if(!($('.myRadio').is(':checked'))){
              alert('Input the radius!');
              return false;
          }
          else{
              return true;
          }
      }
  </script>
  <meta charset="utf-8">
  <meta name="keywords" content="IFMO, Rafikov, Baev, Internet-application programming">
  <meta name="author" content="Rafikov, Baev">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body >
<table class="layout">
  <tr id="header">
    <td>
      <table class="layout">
        <tr>
          <td class="navigationpanel" width="20%" />
          <td class="navigationpanel">
            <p class="navigationpanel">Rafikov M., Baev D., P3217, Variant 785</p>
          </td>
          <td class="navigationpanel" width="20%" />
        </tr>
      </table>
    </td>
  </tr>
  <tr class="body">
    <td>
      <table id="layout">
        <tr>
          <td class="sidespacer" />
          <td id="body">
            <table id="bodylayout" cellpadding="0" cellspacing="0">
                <td id="canvasblock">
                  <canvas onclick="makeForm();" onmousemove="mouseCoords(event)" id="canvas" style="border:1px solid black;" height="500" width="500">
                    <p>Ваш браузер не поддерживает рисование.</p>
                  </canvas>
                  <h2 id="coords"></h2>
                  <script type="text/javascript">
                    function Point(x,y){
                        this.X = x;
                        this.Y = y;
                    }
                      var points=[];
                      var canvas = document.getElementById("canvas");
                      context = canvas.getContext("2d");
                      var img = new Image();
                      img.onload = function(){
                          draw();
                      }
                      img.src = "axis.png";
                      function draw(){
                          context.clearRect(0,0,600,600);
                          var r = document.form.r.value*50;
                          context.drawImage(img,0,0,500,500);
                          //context.translate(250,250);
                          context.fillStyle = "rgb(0, 0, 255)";
                          context.fillRect(250,-r+250,r/2,r);//rectangle
                          context.beginPath();
                          context.arc(250,250,r/2,0,Math.PI/2,false);//round
                          context.lineTo(250,250);
                          context.lineTo(250+r/2,250);
                          context.moveTo(250,250);//triangle
                          context.lineTo(250-r,250);
                          context.lineTo(250,250-r/2);
                          context.fill();
                          context.closePath();
                          redrawPoints();
                      }
                      function redrawPoints() {
                          context.fillStyle = "rgb(255, 0, 0)";
                          for(i=0;i<points.length;i++){
                              context.beginPath();
                              context.arc(points[i].X,points[i].Y,2,0,2*Math.PI,false);
                              context.fill();
                              context.closePath();
                          }
                      }
                      function drawPoint(x,y){
                          points.push(new Point(x,y));
                          context.fillStyle = "rgb(255, 0, 0)";
                          context.beginPath();
                          context.arc(x,y,2,0,2*Math.PI,false);
                          context.fill();
                          context.closePath();
                      }
                      var xCoord;
                      var yCoord;
                      function makeForm(){
                          if(!($('.myRadio').is(':checked'))){
                              alert('Input the radius!');
                          }
                          else{
                              document.form.y.value = window.yCoord;
                              document.getElementsByName("x")[0].checked = true;
                              document.getElementsByName("x")[0].value = window.xCoord;
                              document.form.action = "controller";
                              document.form.submit();
                          }
                      }
                      function mouseCoords(e) {
                          window.xCoord = e.offsetX==undefined?e.layerX:e.offsetX;
                          window.yCoord = e.offsetY==undefined?e.layerY:e.offsetY;
                          window.xCoord = (window.xCoord-250)/50;
                          window.yCoord = -(window.yCoord-250)/50;
                          document.getElementById('coords').innerHTML = "X:"+window.xCoord+";Y:"+window.yCoord;
                      }
                  </script>
                </td>
              </tr>
              </tr>
              <tr>
                <td colspan="2">
                  <p class="caption">Input</p>
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <table class="calculation" cols="3">
                    <form action="controller" method="GET" name="form" onsubmit="return checkInput();">
                      <tr>
                        <th colspan="9" width="50%">
                          <p>X:<p>
                        </th>
                        <th colspan="1" width="25%">
                          <p>Y:<p>
                        </th>
                        <th colspan="5" width="25%">
                          <p>R:<p>
                        </th>
                      </tr>
                      <tr>
                        <td class="x">
                          <input class="myCheckbox" type="checkbox" value="-2" name="x" id="ch1"/>
                          <p><label for="ch1">-2</label></p>
                        </td>
                        <td class="x">
                          <input class="myCheckbox" type="checkbox" value="-1.5" name="x" id="ch2"/>
                          <p><label for="ch2">-1.5</label></p>
                        </td>
                        <td class="x">
                          <input class="myCheckbox" type="checkbox" value="-1" name="x" id="ch3"/>
                          <p><label for="ch3">-1</label></p>
                        </td>
                        <td class="x">
                          <input class="myCheckbox" type="checkbox" value="-0.5" name="x" id="ch4"/>
                          <p><label for="ch4">-0.5</label></p>
                        </td>
                        <td class="x">
                          <input class="myCheckbox" type="checkbox" value="0" name="x" id="ch5"/>
                          <p><label for="ch5">0</label></p>
                        </td>
                        <td class="x">
                          <input class="myCheckbox" type="checkbox" value="0.5" name="x" id="ch6"/>
                          <p><label for="ch6">0.5</label></p>
                        </td>
                        <td class="x">
                          <input class="myCheckbox" type="checkbox" value="1" name="x" id="ch7" />
                          <p><label for="ch7">1</label></p>
                        </td>
                        <td class="x">
                          <input class="myCheckbox" type="checkbox" value="1.5" name="x" id="ch8"/>
                          <p><label for="ch8">1.5</label></p>
                        </td>
                        <td class="x">
                          <input class="myCheckbox" type="checkbox" value="2" name="x" id="ch9"/>
                          <p><label for="ch9">2</label></p>
                        </td>

                        <td class="y">
                          <input name="y" required type="text" />
                        </td>
                        <td class="r">
                          <input class="myRadio" onclick="draw();" type="radio" value="1" name="r" id="rd1"/>
                          <p><label for="rd1">1</label></p>
                        </td>
                        <td class="r">
                          <input class="myRadio" onclick="draw();" type="radio" value="2" name="r" id="rd2"/>
                          <p><label for="rd2">2</label></p>
                        </td>
                        <td class="r">
                          <input class="myRadio" onclick="draw();" type="radio" value="3" name="r" id="rd3"/>
                          <p><label for="rd3">3</label></p>
                        </td>
                        <td class="r">
                          <input class="myRadio" onclick="draw();" type="radio" value="4" name="r" id="rd4"/>
                          <p><label for="rd4">4</label></p>
                        </td>
                        <td class="r">
                          <input class="myRadio" onclick="draw();" type="radio" value="5" name="r" id="rd5"/>
                          <p><label for="rd5">5</label></p>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="15">
                          <input id="formsubmit" type="submit" value="Submit" />
                        </td>
                      </tr>
                    </form>
                  </table>
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <p id="caption">History</p>
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <table class="calculation">
                    <tr>
                      <th width="15%">
                        <p>number</p>
                      </th>
                      <th width="15%">
                        <p>X</p>
                      </th>
                      <th width="15%">
                        <p>Y</p>
                      </th>
                      <th width="15%">
                        <p>R</p>
                      </th>
                      <th>
                        <p>Result</p>
                      </th>
                    </tr>
                    <%ArrayList<Double> x;
                      ArrayList<Double> y;
                      ArrayList<Integer> r;
                      ArrayList<String> res;
                      if(request.getSession().getAttribute("result")!=null) {
                        pointsBean.setX((Double) request.getSession().getAttribute("x"));
                        pointsBean.setY((Double) request.getSession().getAttribute("y"));
                        pointsBean.setR((Integer) request.getSession().getAttribute("r"));
                        pointsBean.setResult((String) request.getSession().getAttribute("result"));
                        x = pointsBean.getX();
                        y = pointsBean.getY();
                        r = pointsBean.getR();
                        res = pointsBean.getRes();
                    }
                    else{
                        x = pointsBean.getX();
                        y = pointsBean.getY();
                        r = pointsBean.getR();
                        res = pointsBean.getRes();
                      }
                      for (int i = 0; i < res.size(); i++) {
                        out.println("<tr>" +
                                "<td>" +
                                "<p>" + (i+1) + "</p>" +
                                "</td>" +
                                "<td>" +
                                "<p>" + x.get(i) + "</p>" +
                                "</td>" +
                                "<td>" +
                                "<p>" + y.get(i) + "</p>" +
                                "</td>" +
                                "<td>" +
                                "<p>" + r.get(i) + "</p>" +
                                "</td>" +
                                "<td>" +
                                "<p>" + res.get(i) + "</p>" +
                                "</td>" +
                                "</tr>" +
                                "<script>drawPoint("+(x.get(i)*50+250)+","+(-y.get(i)*50+250)+");</script>");
                      }
                      ;
                      request.getSession().setAttribute("result",null);
                    %>
                  </table>
                </td>
              </tr>
              <tr>
                <td />
                <td>

                </td>
              </tr>
            </table>
          </td>
          <td class="sidespacer" />
        </tr>
      </table>
    </td>
  </tr>
</table>
<script type="text/javascript">
    var $unique = $('input[type="checkbox"]');
    $unique.click(function() {
        $unique.filter(':checked').not(this).removeAttr('checked');
    });
</script>
</body>
</html>