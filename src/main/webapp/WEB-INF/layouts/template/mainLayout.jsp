<!DOCTYPE html>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>web-application of term directory</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addition.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jkeyboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fileinput.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme-fa.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.css"/>

</head>
<body>
<nav class="navbar navbar-dark bg-dark" style="padding-right: 2em">
    <div class="row">
        <a href="<c:url value='/terms/all' />" class="navbar-brand d-flex ml-2 align-items-center">
            <strong>TERMS</strong>
        </a>
        <div class="col text-left">
            <a href="<c:url value='/terms/add' />" class="btn btn-outline-success custom-width">
                <i class="fas fa-plus-circle"></i> Add Term</a>
            <a href="<c:url value='/terms/admin-list' />" class="btn btn-outline-success custom-width">
                <i class="fas fa-list-ol"></i> Terms List</a>
            <a href="<c:url value='/subjects/add' />" class="btn btn-outline-success custom-width">
                <i class="fas fa-plus-circle"></i> Add Subject</a>
            <a href="<c:url value='/subjects/all' />" class="btn btn-outline-success custom-width">
                <i class="fas fa-list-ol"></i> Subjects List</a>
        </div>
    </div>
    <div class="row">
        <div class="float-right">
            <a href="<c:url value='#' />" class="btn btn-outline-success custom-width">
                <i class="fas fa-user-circle"></i> Login</a>
        </div>
    </div>
</nav>

<main role="main" class="mb-lg-5">
    <tiles:insertAttribute name="content" />
</main>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"> </script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"> </script>
<script defer src="<c:url value="/resources/js/fontawesome-all.js"/>"></script>
<script src="<c:url value="/resources/js/jkeyboard.js"/>"></script>
<script src="<c:url value="/resources/js/fileinput.js"/>"></script>
<script src="<c:url value="/resources/js/theme-fa.js"/>"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.js"></script>

<script>
    $('#my_modal').on('show.bs.modal', function(e) {
        var subjectId = $(e.relatedTarget).data('subject-id');
        $(e.currentTarget).find('input[name="subjectId"]').val(subjectId);
    });
</script>
<script>
    $(document).ready(function(){
        $('#myTable').dataTable({
            "lengthMenu": [ 5, 10, 20, 25, 50]
        });
    });
</script>
<script>
    $('#keyboard').jkeyboard({
        layout: "transcription",
        input: $('#transcription')
    });
</script>
<script>
    $("#term-file").fileinput({
        'theme': 'fa',
        initialPreviewAsData: true,
        maxFileSize: 5124,
        'allowedFileExtensions': ['jpg']
    });
</script>
<script>
    var input = document.getElementById('transcription');
    var message = document.getElementsByClassName('newone')[0];
    input.addEventListener('focus', function() {
        message.style.display = 'block';
    });
</script>
</body>
</html>
