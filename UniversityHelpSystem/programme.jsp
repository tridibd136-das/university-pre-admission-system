<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>ABC University | Programmes</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="hero-bg"></div>

<div class="layout">
    <aside class="sidebar">
        <h2>ABC University</h2>
        <p>Pre-Admission Portal</p>

        <a href="index.jsp">Home</a>
        <a href="programme.jsp">Programme List</a>
        <a href="contact.jsp">Contact Us</a>
    </aside>

    <main class="content">
        <div class="badge">Course Catalogue</div>
        <h1>Available Programmes</h1>
        <p class="lead">Choose the right academic path for your career growth.</p>

        <table>
            <tr>
                <th>Programme Code</th>
                <th>Programme Name</th>
                <th>Duration</th>
            </tr>

            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/programme_detail",
                        "root",
                        "1234"
                    );

                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM prog");

                    while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("prog_code") %></td>
                <td><%= rs.getString("prog_name") %></td>
                <td><%= rs.getInt("duration") %> Years</td>
            </tr>
            <%
                    }
                    con.close();
                } catch(Exception e) {
                    out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
                }
            %>
        </table>
    </main>
</div>

</body>
</html>