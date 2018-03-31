<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Term Directory</h1>
        <p class="lead text-muted">Enter keywords to finding your word ...</p>
    </div>
    <form class="col-lg-8 offset-lg-2 mt-5">
        <div class="row justify-content-center">
            <input type="text" class="form-control" style="width: 90%">
            <button class="btn btn-outline-success ml-2" type="submit">Search</button>
        </div>
    </form>
</section>

<div class="album py-2 bg-light">
    <div class="container">
        <div class="row">
            <c:forEach items="${terms}" var="term">
                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <div class="card-body">
                            <p class="card-text term-title">
                                    ${term.english}
                            </p>
                            <hr/>
                            <p class="card-text term-transcription">
                                [${term.transcription}]
                            </p>
                            <p class="card-text term-another-lang">
                            <p>
                                <span class="flag-icon flag-icon-ua"></span>
                                    ${term.ukraine}
                            </p>
                            <p>
                                <span class="flag-icon flag-icon-ru"></span>
                                    ${term.russian}
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="<c:url value='/terms/term-${term.id}' />"
                                       class="btn btn-sm btn-outline-secondary"
                                       role="button" aria-pressed="true"><i class="fas fa-info-circle"></i> Details</a>
                                </div>
                                <small class="text-muted">add: <fmt:formatDate pattern="dd/MM/yy hh:mm"
                                                                               value="${term.added}"/></small>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
