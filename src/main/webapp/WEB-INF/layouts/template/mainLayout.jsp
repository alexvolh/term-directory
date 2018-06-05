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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lightgallery.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/datatables.min.css">
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
</nav>
<main role="main" class="mb-lg-5">
    <tiles:insertAttribute name="content" />
</main>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"> </script>
<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"> </script>
<script defer src="<c:url value="/resources/js/fontawesome-all.js"/>"></script>
<script src="<c:url value="/resources/js/jkeyboard.js"/>"></script>
<script src="<c:url value="/resources/js/fileinput.js"/>"></script>
<script src="<c:url value="/resources/js/theme-fa.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap-select.js"/>"></script>
<script src="<c:url value="/resources/js/datatables.min.js"/>"></script>
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

<script>
    $('.selectpicker').selectpicker({
        style: 'btn btn-outline-success',
        title: 'Select subject for filtering',
        liveSearch: true,
        size: 5
    });
</script>

<script>
    $(document).ready(function(){
        $('#lightgallery').lightGallery({
            share: false,
            mode: 'lg-fade',
            cssEasing : 'cubic-bezier(0.25, 0, 0.25, 1)'
        });
    });
</script>
<script src="<c:url value="/resources/js/picturefill.min.js"/>"></script>
<script src="<c:url value="/resources/js/lightgallery-all.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.mousewheel.min.js"/>"></script>
</body>
</html>