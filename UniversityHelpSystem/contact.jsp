<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>ABC University | Contact</title>
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

        <div class="badge">Admission Help Desk</div>

        <h1>Contact Us</h1>

        <p class="lead">
            Have any admission query? Fill the form below.
        </p>

        <%
            String message = "";

            if(request.getMethod().equalsIgnoreCase("POST")) {

                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String query = request.getParameter("query");

                try {

                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/programme_detail",
                        "root",
                        "1234"
                    );

                    PreparedStatement ps = con.prepareStatement(
                        "INSERT INTO contact_queries(name, phone, email, query) VALUES (?, ?, ?, ?)"
                    );

                    ps.setString(1, name);
                    ps.setString(2, phone);
                    ps.setString(3, email);
                    ps.setString(4, query);

                    int result = ps.executeUpdate();

                    if(result > 0) {
                        message = "Query Submitted Successfully!";
                    }

                    con.close();

                } catch(Exception e) {
                    message = "Error : " + e.getMessage();
                }
            }
        %>

        <% if(!message.equals("")) { %>

            <div class="success">
                <%= message %>
            </div>

        <% } %>

        <form method="post" action="contact.jsp">

            <label>Your Name</label>
            <input type="text" name="name" required>

            <label>Contact Phone</label>
            <input type="text" name="phone" required>

            <label>Your E-mail</label>
            <input type="email" name="email" required>

            <label>Query</label>
            <textarea name="query" required></textarea>

            <button type="submit">Submit Query</button>

        </form>

    </main>

</div>

</body>
</html>