<%@ page import="config.DatabaseConnection" %>

<%
    if(DatabaseConnection.getConnection() != null){
        out.println("Database Connected");
    }else{
        out.println("Database Failed");
    }
%>