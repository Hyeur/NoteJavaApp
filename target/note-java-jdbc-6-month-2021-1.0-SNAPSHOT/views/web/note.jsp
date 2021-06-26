<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="APIurl" value="/api-admin-note"/>
<!DOCTYPE html>
<html lang="en">
<title>Notes</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/paging.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/style.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<link href="${pageContext.request.contextPath}/views/css/default.css" rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
<script src="<c:url value="/views/paging/jquery.twbsPagination.js"/>"></script>
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
<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding"
     style="z-index:3;width:300px;font-weight:bold;"
     id="mySidebar"><br>
    <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft"
       style="width:100%;font-size:22px">Close Menu</a>
    <div class="w3-container">
        <h3 class="w3-padding-64"><b>Note<br>App</b></h3>
    </div>
    <div class="w3-bar-block">
        <a href="#" class="w3-bar-item w3-button w3-hover-white">Notes</a>
        <a href="#" class="w3-bar-item w3-button w3-hover-white">Account</a>
        <a href="<c:url value="/Logout?action=logout"/>" class="w3-bar-item w3-button w3-hover-white">Logout</a>
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
<form action="<c:url value="/user-notes-list"/>" id="currentPageform" method="get">
    <div class="w3-main" style="margin-left:340px;margin-right:40px">
        <input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>


        <!-- Header -->
        <div class="w3-container" style="margin-top:80px" id="showcase">
            <h1 class="w3-jumbo"><b>Welcome back</b></h1>
            <h1 class="w3-xxxlarge w3-text-red"><b id="permit">${USERMODEL.fullName}</b></h1>
            <hr style="width:50px;border:5px solid red" class="w3-round">
        </div>
        <div class="Searching">
            <div class="search-container">
                <form>
                    <input type="text" id="search" placeholder="Search.." name="search">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
        </div>
        <% int noteIndex = 1;%>
        <c:forEach var="item" items="${model.listResult}">
            <div class="container-fluid" id="noteContainer<%=noteIndex%>">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-container">
                            <form id="formUpdate<%=noteIndex%>" class="updateform">
                                <h3 id="h3-<%=noteIndex%>">
                                    <strong id="Title<%=noteIndex%>">${item.title}</strong>
                                    <input type="text" value="${item.title}" name="title" id="title<%=noteIndex%>"
                                           style="display: none">
                                    <input type="hidden" value="${item.id}" id="id<%=noteIndex%>"
                                           name="id">

                                </h3>
                                <span class="badge badge-default">${item.createdDate}</span>
                                <p id="p-<%=noteIndex%>" style="text-align: start">${item.content}</p>
                                <p><textarea name="content" type="text" id="content<%=noteIndex%>"
                                             style="display: none;text-align: start">${item.content}</textarea></p>
                            </form>
                        </div>
                    </div>
                    <div class="btn-group btn-group-md" role="group">
                        <c:url var="editURL" value="/admin-notes-list">
                            <c:param name="type" value="edit"/>
                            <c:param name="id" value="${item.id}"/>
                        </c:url>
                        <button class="btn btn-secondary" type="button" id="view<%=noteIndex%>"
                                onclick="handlelick(this.id)">
                            View
                        </button>
                        <button class="btn btn-secondary" type="button" href="${editURL}" id="edit<%=noteIndex%>">
                            Edit
                        </button>
                        <button class="btn btn-secondary" type="button" id="delete<%=noteIndex%>">
                            Delete
                        </button>
                        <button class="btn btn-secondary" type="button" id="deleteQ<%=noteIndex%>"
                                style="display: none;transform: scale(1.2);color: black">
                            Delete ?
                        </button>
                        <button class="btn btn-secondary" type="button" style="display: none" id="cancel<%=noteIndex%>">
                            Discard
                        </button>
                        <button class="btn btn-secondary" type="button" style="display: none" id="save<%=noteIndex%>">
                            Save
                        </button>
                        <%
                            String i = (String) request.getParameter("maxPageItem");
                            if (i != null) {
                                session.setAttribute("test", i);
                            }
                            Integer maxpageitem = Integer.parseInt((String) session.getAttribute("test"));
                            if (noteIndex < maxpageitem) {
                                noteIndex = noteIndex + 1;
                            }
                        %>
                    </div>
                </div>
            </div>
        </c:forEach>
        <% int viewIndex = 1; %>
        <c:forEach var="item" items="${model.listResult}">
            <div class="bg-view" id="<%=viewIndex%>" title="close">
                <div class="view-content">
                    <div type="button" class="close" id="close" onclick="handlelick(this.id)">+</div>
                    <div class="col-md-12">
                        <div class="text-container">
                            <h3>
                                <strong>${item.title}</strong>
                            </h3>
                            <span class="badge badge-default">${item.createdDate}</span>
                            <p>
                                    ${item.content}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <%
                String i = (String) request.getParameter("maxPageItem");
                if (i != null) {
                    session.setAttribute("test", i);
                }
                Integer maxpageitem = Integer.parseInt((String) session.getAttribute("test"));

                if (viewIndex < maxpageitem)
                    viewIndex = viewIndex + 1;
            %>
        </c:forEach>

        <ul id="pagination" class="pagination"></ul>
        <input type="hidden" value="" id="page" name="to-page"/>

        <input type="hidden" value="" id="sortTitle" name="sortTitle"/>
        <input type="hidden" value="" id="sortBy" name="sortBy"/>
        <input type="hidden" value="" id="type" name="type"/>
        <!-- End page content -->
    </div>
    </div>
</form>
<a href="<c:url value="/user-notes-list?type=add"/>" class="circle"><i class="fa fa-plus" aria-hidden="true"></i></a>

<script type="text/javascript">
    var totalPage = ${model.totalPage};
    var currentPage = ${model.page};
    var limit = 4;
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 3,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage !== page) {
                    $('#maxPageItem').val(limit);
                    $('#page').val(page);
                    $('#sortTitle').val('how');
                    $('#sortBy').val('desc');
                    $('#type').val('list');
                    $('#currentPageform').submit();

                }
            }
        })
    });

    $(document).ready(function () {
        $("#edit1").click(function () {
            $("#title1").val($("#Title1").html());
            $("#content1").val($("#p-1").html());
            $("#h3-1 strong").hide();
            $("#p-1").hide();
            $("#title1").show();
            $("#content1").show();
            $("#cancel1").show("slow");
            $("#save1").show("slow");

        });
        $("#edit2").click(function () {
            $("#title2").val($("#Title2").html());
            $("#content2").val($("#p-2").html());
            $("#h3-2 strong").hide();
            $("#p-2").hide();
            $("#title2").show();
            $("#content2").show();
            $("#cancel2").show("slow");
            $("#save2").show("slow");
        });
        $("#edit3").click(function () {
            $("#title3").val($("#Title3").html());
            $("#content3").val($("#p-3").html());
            $("#h3-3 strong").hide();
            $("#p-3").hide();
            $("#title3").show();
            $("#content3").show();
            $("#cancel3").show("slow");
            $("#save3").show("slow");
        });
        $("#edit4").click(function () {
            $("#title4").val($("#Title4").html());
            $("#content4").val($("#p-4").html());
            $("#h3-4 strong").hide();
            $("#p-4").hide();
            $("#title4").show();
            $("#content4").show();
            $("#cancel4").show("slow");
            $("#save4").show("slow");
        });

    });

    $(document).ready(function () {
        $("#cancel1").click(function (cancel) {
            $("#h3-1 strong").show();
            $("#p-1").show();
            $("#title1").hide();
            $("#content1").hide();
            $("#cancel1").hide("slow");
            $("#save1").hide("slow");
        });
        $("#cancel2").click(function () {
            $("#h3-2 strong").show();
            $("#p-2").show();
            $("#title2").hide();
            $("#content2").hide();
            $("#cancel2").hide("slow");
            $("#save2").hide("slow");
        });
        $("#cancel3").click(function () {
            $("#h3-3 strong").show();
            $("#p-3").show();
            $("#title3").hide();
            $("#content3").hide();
            $("#cancel3").hide("slow");
            $("#save3").hide("slow");
        });
        $("#cancel4").click(function () {
            $("#h3-4 strong").show();
            $("#p-4").show();
            $("#title4").hide();
            $("#content4").hide();
            $("#cancel4").hide("slow");
            $("#save4").hide("slow");
        });
    });


    function handlelick(clickedId) {
        if (clickedId === "view1") {
            $("#1").css('display', 'flex');
        } else if (clickedId === "view2") {
            $("#2").css('display', 'flex');
        } else if (clickedId === "view3") {
            $("#3").css('display', 'flex');
        } else if (clickedId === "view4") {
            $("#4").css('display', 'flex');
        } else if (clickedId === "close") {
            $("[title~='close']").css('display', 'none');
        }
    }

    function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("myOverlay").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("myOverlay").style.display = "none";
    }

    $(document).ready(function () {
        $("#delete1").click(function () {
            $("#delete1").hide("slow").delay(2000).show("slow");
            $("#deleteQ1").show("slow").delay(2000).hide("slow");

            $("#deleteQ1").click(function () {
                $("#noteContainer1").fadeOut(1200);
            });

        });
        $("#delete2").click(function () {
            $("#delete2").hide("slow").delay(2000).show("slow");
            $("#deleteQ2").show("slow").delay(2000).hide("slow");
            $("#deleteQ2").click(function () {
                $("#noteContainer2").fadeOut(1200);
            });

        });
        $("#delete3").click(function () {
            $("#delete3").hide("slow").delay(2000).show("slow");
            $("#deleteQ3").show("slow").delay(2000).hide("slow");
            $("#deleteQ3").click(function () {
                $("#noteContainer3").fadeOut(1200);
            });

        });
        $("#delete4").click(function () {
            $("#delete4").hide("slow").delay(2000).show("slow");
            $("#deleteQ4").show("slow").delay(2000).hide("slow");
            $("#deleteQ4").click(function () {
                $("#noteContainer4").fadeOut(1200);
            });

        });

    });

    $(document).ready(function () {
        $("#save1").click(function (e) {
            e.preventDefault();
            var data1 = {};
            var formData1 = $("#formUpdate1").serializeArray();
            $.each(formData1, function (i, v) {
                console.log(v);
                data1["" + v.name + ""] = v.value;
            });
            var id = $("#id1").val();
            if (id != null) {

                updateNote(data1, "#Title1", "#title1", "#p-1", "#content1");

                $("#h3-1 strong").show();
                $("#p-1").show();
                $("#title1").hide();
                $("#content1").hide();
                $("#cancel1").hide("slow");
                $("#save1").hide("slow");
            }
        });
        $("#save2").click(function (e) {
            e.preventDefault();
            var data2 = {};
            var formData2 = $("#formUpdate2").serializeArray();
            $.each(formData2, function (i, v) {
                console.log(v);
                data2["" + v.name + ""] = v.value;
            });
            var id = $("#id2").val();
            if (id != null) {

                updateNote(data2, "#Title2", "#title2", "#p-2", "#content2");

                $("#h3-2 strong").show();
                $("#p-2").show();
                $("#title2").hide();
                $("#content2").hide();
                $("#cancel2").hide("slow");
                $("#save2").hide("slow");
            }
        });
        $("#save3").click(function (e) {
            e.preventDefault();
            var data3 = {};
            var formData3 = $("#formUpdate3").serializeArray();
            $.each(formData3, function (i, v) {
                console.log(v);
                data3["" + v.name + ""] = v.value;
            });
            var id = $("#id3").val();
            if (id != null) {
                updateNote(data3, "#Title3", "#title3", "#p-3", "#content3");

                $("#h3-3 strong").show();
                $("#p-3").show();
                $("#title3").hide();
                $("#content3").hide();
                $("#cancel3").hide("slow");
                $("#save3").hide("slow");

            }
        });
        $("#save4").click(function (e) {
            e.preventDefault();
            var data4 = {};
            var formData4 = $("#formUpdate4").serializeArray();
            $.each(formData4, function (i, v) {
                console.log(v);
                data4["" + v.name + ""] = v.value;
            });
            var id = $("#id4").val();
            if (id != null) {
                updateNote(data4, "#Title4", "#title4", "#p-4", "#content4");

                $("#h3-4 strong").show();
                $("#p-4").show();
                $("#title4").hide();
                $("#content4").hide();
                $("#cancel4").hide("slow");
                $("#save4").hide("slow");

            }

        });


        function updateNote(data, title1, title2, content1, content2) {
            $.ajax({
                url: '${APIurl}',
                type: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'json',
                success: function (result) {
                    console.log(result);
                    $(title1).html(result.title);
                    $(title2).val(result.title);
                    $(content1).html(result.content);
                    $(content2).html(result.content);
                    console.log($(title1).html());
                    console.log($(title2).val());
                    console.log($(content1).html());
                    console.log($(content2).html());
                },
                error: function (error) {
                    console.log(error);
                },

            });

        }
    });

    $(document).ready(function () {
        $("#deleteQ1").click(function (e) {

            e.preventDefault();
            var data1 = {};
            var formData1 = $("#formUpdate1").serializeArray();
            $.each(formData1, function (i, v) {
                if (i === 1) {
                    data1["" + v.name + ""] = v.value;
                }
            });

            console.log(data1);
            deleteNote(data1);
        });
        $("#deleteQ2").click(function (e) {

            e.preventDefault();
            var data2 = {};
            var formData2 = $("#formUpdate2").serializeArray();
            $.each(formData2, function (i, v) {
                if (i === 1) {
                    data2["" + v.name + ""] = v.value;
                }
            });

            console.log(data2);
            deleteNote(data2);
        });
        $("#deleteQ3").click(function (e) {

            e.preventDefault();
            var data3 = {};
            var formData3 = $("#formUpdate3").serializeArray();
            $.each(formData3, function (i, v) {
                if (i === 1) {
                    data3["" + v.name + ""] = v.value;
                }
            });

            console.log(data3);
            deleteNote(data3);
        });
        $("#deleteQ4").click(function (e) {

            e.preventDefault();
            var data4 = {};
            var formData4 = $("#formUpdate4").serializeArray();
            $.each(formData4, function (i, v) {
                if (i === 1) {
                    data4["" + v.name + ""] = v.value;
                }
            });

            console.log(data4);
            deleteNote(data4);
        });

        function deleteNote(data) {
            $.ajax({
                url: '${APIurl}',
                type: 'DELETE',
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function (id) {
                    console.log(id);
                },
                error: function (erroR) {
                    console.log(erroR);
                },

            });

        }
    });


</script>

</body>

</html>