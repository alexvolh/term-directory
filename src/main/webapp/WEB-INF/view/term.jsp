<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container ml-5 mt-5">
    <div class="row">
        <div class="col-sm-auto" style="width: 250px; height: 350px">
            <img src="<c:url value="${pageContext.request.contextPath}/terms-pic/${term.imageLink}"></c:url>"
                 alt="image" style="width: 100%"/>
        </div>
        <div class="col-lg-auto">
            <div class="col-lg-auto term-title-info">
                <span class="flag-icon flag-icon-gb"></span> ${term.english}
            </div>
            <div class="col-lg-auto pt-3 term-transcription-info">
                [${term.transcription}]
            </div>
                <div class="col-lg-auto pt-5 term-ru-ukr-info">
                    <span class="flag-icon flag-icon-ru"></span> ${term.russian}
                </div>
                <div class="col-lg-auto pt-5 term-ru-ukr-info">
                    <span class="flag-icon flag-icon-ua"></span> ${term.ukraine}
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-2 pt-5 term-title2-info">
            Subject area:
        </div>
    </div>
    <div class="row">
        <div class="col-lg-auto pt-3 term-list-info">
            <ul>
                <c:forEach items="${term.subjects}" var="subject">
                    <li> ${subject.english}</li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 pt-5 term-title2-info">
            Description:
        </div>
    </div>
    <div class="row">
        <div class="col-lg-10 pt-3 term-description-info">
            ${term.description}
        </div>
    </div>
    <div class="row">
        <div class="col-lg-10 pt-3">
        <a href="<c:url value='/terms/all' />" class="btn btn-info custom-width">
            <i class="fas fa-list-ol"></i> Go to terms</a>
        </div>
    </div>
</div>