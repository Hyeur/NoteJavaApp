<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="admin/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="UserAPIurl" value="/api-admin-user"/>
<c:url var="HomeAfterSign" value="/Login?action=login"/>
<c:url var="AccExist" value="/Sign?action=sign&message=username_exist&alert=danger"/>

<!DOCTYPE html>
<html lang="en">
<title>Sign up!</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/default.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/signup.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
    <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
    <div class="w3-container">
        <h3 class="w3-padding-64"><b>Note<br>App</b></h3>
    </div>

</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-red w3-xlarge w3-padding">
    <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">☰</a>
    <span>Note App</span>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<div class="LOGIN">
    <div class="welcomeLogin">
        <h3>Welcome to Note App</h3>
    </div>
    <div class="welcomeLogin">
        <h3><small><small></small>Sign up new one</small>
            </small>
        </h3>
    </div>

    <div class="Login-container">
        <form action="<c:url value="/Sign"/>" method="post" id="Signupaccount">
                <pre>
                    Fullname   <input type="text" id="fullName" name="fullName">

                    Username   <input type="text" id="userName" name="userName">

                    Password   <input type="passWord"  name="passWord">

                            <a type="button" id="sign" style="cursor: pointer"> Sign Up </a>

                </pre>
        </form>
        <c:if test="${not empty message}">
            <div class="alert alert-${alert}">
                <strong>${message}</strong>
            </div>
        </c:if>
    </div>
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

    // Modal Image Gallery
    function onClick(element) {
        document.getElementById("img01").src = element.src;
        document.getElementById("modal01").style.display = "block";
        var captionText = document.getElementById("caption");
        captionText.innerHTML = element.alt;
    }

    $(document).ready(function () {
        $("#sign").click(function (e) {
            e.preventDefault();
            var data = {};
            var formData = $("#Signupaccount").serializeArray();
            $.each(formData, function (i, v) {
                data["" + v.name + ""] = v.value;
            });
            console.log(data)
            addUser(data);

        });

        function addUser(data) {
            $.ajax({
                url: '${UserAPIurl}',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'json',
                success: function (result) {
                    console.log(result);
                        window.location.href = "${HomeAfterSign}";
                },
                error: function (error) {
                    console.log(error);
                    window.location.href = "${AccExist}";
                },
            });

        }

    });



</script>

</body>

</html>