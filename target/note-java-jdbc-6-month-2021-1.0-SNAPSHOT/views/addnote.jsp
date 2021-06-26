<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="admin/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="APIurl" value="/api-admin-note"/>
<c:url var="AdminAfterAddReload" value="/admin-notes-list?type=list&to-page=1&maxPageItem=4"/>
<c:url var="UserAfterAddReload" value="/user-notes-list?type=list&to-page=1&maxPageItem=4"/>
<!DOCTYPE html>
<html lang="en">
<title>Notes</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/default.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/style.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
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

    div .bg-view {
        animation-name: bg-view;
        animation-duration: 3s;
    }

    @keyframes bg-view {
        0% {
            display: none;
        }
        100% {
            display: flex;
        }
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

<body onLoad="window.scroll(0, 500)">
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;"
     id="mySidebar"><br>
    <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft"
       style="width:100%;font-size:22px">Close Menu</a>
    <div class="w3-container">
        <h3 class="w3-padding-64"><b>Add Note<br>Page</b></h3>
    </div>
    <div class="w3-bar-block">
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

<div class="form-container">
    <div class="add-form">
        <form id="formAddNote">
            </br>
            </br>
            </br>
            </br>
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" id="title" aria-describedby="emailHelp" name="title">
            </div>
            </br>
            </br>
            <div class="form-group">
                <label for="content">Content</label>
                <textarea type="text" class="form-control" id="content" name="content" style="resize: both"></textarea>
            </div>
            </br>
            </br>
            <c:if test="${USERMODEL.roleId == 1}">
                <input type="hidden" id="permit" value="admin">
                <a class="btn btn-primary" id="submit"> Submit </a>
            </c:if>
            <c:if test="${USERMODEL.roleId != 1}">
                <input type="hidden" id="permit" value="user">
                <a class="btn btn-primary" id="submit"> Submit </a>
            </c:if>
        </form>


    </div>
</div>

<a class="circle" href="javascript:history.back()"><i class="fa fa-plus" aria-hidden="true"
                                                      style="transform: rotate(45deg);"></i></a>

<script>
    function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("myOverlay").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("myOverlay").style.display = "none";
    }

    $(document).ready(function () {
        $("#submit").click(function (e) {
            e.preventDefault();
            var data = {};
            var formData = $("#formAddNote").serializeArray();
            $.each(formData, function (i, v) {
                console.log(v);
                data["" + v.name + ""] = v.value;
            });
            addNote(data);

        });

        function addNote(data) {
            $.ajax({
                url: '${APIurl}',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'json',
                success: function (result) {
                    console.log(result);
                    if ($("#permit").val() === "admin"){
                        window.location.href = "${AdminAfterAddReload}";
                    } else if ($("#permit").val() === "user") {
                        window.location.href = "${UserAfterAddReload}";
                    }
                },
                error: function (error) {
                    console.log(error);
                },
            });

        }

    });


</script>

</body>

</html>