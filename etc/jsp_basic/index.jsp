<html>
  <head>
    <title> This is The title </title>
  </head>
  <body>
    <%@ page import = "java.sql.*" %>

    <%
    Class.forName("oracle.jdbc.driver.OracleDriver");  
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TESTDB", "scott", "tiger");
    Statement stmt = conn.createStatement();
    String sql="SELECT * FROM holiday_master";
    ResultSet rs = stmt.executeQuery(sql);
    try
    {
    if(rs!=null)
    {
    %>
    <table border=1 cellpadding=5><tr><td> hloday date</td><td>Holiday Description</td></tr>
    <%
    while(rs.next())
    {
    %>
    <tr>
      <td><%=rs.getString("theday")%></td>
      <td><%=rs.getString("thedesc")%></td>
    </tr>
    <%
    }
    }
    }
    catch(SQLException e)
    {
    e.printStackTrace();
    }
    stmt.close();
    rs.close();
    conn.close();
    stmt = null;
    rs=null;
    conn=null;
    %>
    </table>
  </body>
</html>

