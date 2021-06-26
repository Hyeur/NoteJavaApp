<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<title>Notes</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<link href="${pageContext.request.contextPath}/views/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/views/css/default.css" rel="stylesheet" type="text/css">
<style>
    body,
    h1,
    h2,
    h3,
    h4,
    h5 {
        font-family: "Poppins", sans-serif
    }

    body {
        font-size: 16px;
    }

    .w3-half img {
        margin-bottom: -6px;
        margin-top: 16px;
        opacity: 0.8;
        cursor: pointer
    }

    .w3-half img:hover {
        opacity: 1
    }
</style>

<body>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;"
     id="mySidebar"><br>
    <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft"
       style="width:100%;font-size:22px">Close Menu</a>
    <div class="w3-container">
        <h3 class="w3-padding-64"><b>Note<br>App</b></h3>
    </div>
    <div class="w3-bar-block">
        <c:if test="${not empty USERMODEL}">

            <c:if test="${USERMODEL.roleId == 1}">
                <a href="<c:url value="/admin-notes-list?type=list&to-page=1&maxPageItem=4"/>"
                   class="w3-bar-item w3-button w3-hover-white">All Notes</a>
            </c:if>
            <c:if test="${USERMODEL.roleId != 1}">
                <a href="<c:url value="/user-notes-list?type=list&to-page=1&maxPageItem=4"/>"
                   class="w3-bar-item w3-button w3-hover-white">All Notes</a>
            </c:if>

            <a href="<c:url value="/Logout?action=logout"/>" class="w3-bar-item w3-button w3-hover-white">Logout</a>
        </c:if>
        <c:if test="${empty USERMODEL}">
            <a href="<c:url value="/Sign?action=sign"/>" class="w3-bar-item w3-button w3-hover-white">Sign Up</a>
            <a href="<c:url value="/Login?action=login"/>" class="w3-bar-item w3-button w3-hover-white">Login</a>
        </c:if>

    </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-red w3-xlarge w3-padding">
    <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">☰</a>
    <span>Company Name</span>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu"
     id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">

    <!-- Header -->
    <c:if test="${empty USERMODEL}">
        <div class="w3-container" style="margin-top:80px" id="showcase">
            <h1 class="w3-jumbo"><b>Welcome to Note App.</b></h1>
            <h1 class="w3-xxxlarge w3-text-red"><b></b></h1>
            <hr style="width:50px;border:5px solid red" class="w3-round">
        </div>
    </c:if>
    <c:if test="${not empty USERMODEL}">
        <div class="w3-container" style="margin-top:80px" id="showcase">
            <h1 class="w3-jumbo"><b>Welcome back</b></h1>
            <h1 class="w3-xxxlarge w3-text-red"><b>${USERMODEL.fullName}</b></h1>
            <hr style="width:50px;border:5px solid red" class="w3-round">
        </div>
    </c:if>


    <!-- End page content -->
</div>

<script>
    // Script to open and close sidebar
    function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("myOverlay").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("myOverlay").style.display = "none";
    }
</script>

</body>

</html>