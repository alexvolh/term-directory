<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container mt-5">
    <table id="myTable" class="table table-striped">
        <thead>
        <tr>
            <th>en subject</th>
            <th>ru subject</th>
            <th>ukr subject</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${subjects}" var="subject">
            <tr>
                <td>${subject.english}</td>
                <td>${subject.ukraine}</td>
                <td>${subject.russian}</td>
                <td>
                    <a href="<c:url value='/terms/edit-term-${term.id}' />" class="btn btn-warning custom-width">
                        <i class="fas fa-edit"></i> Edit</a>
                </td>
                <td>
                    <a href="#my_modal" class="btn btn-danger custom-width" data-toggle="modal" data-subject-id="${subject.id}"><i class="fas fa-trash"></i> Delete</a>

                    <div class="modal" id="my_modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h6>Remove subject</h6>
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                                            class="sr-only">Close</span></button>
                                </div>
                                <form action="/subjects/delete-subject" method="post">
                                    <div class="modal-body">
                                        <input type="hidden" name="subjectId" value="${subject.id}"/>
                                        <div class="alert alert-danger">
                                            <p>Are you sure you want to delete this topic with all related terms ?</p>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit"  class="btn btn-danger custom-width"><i class="fas fa-check"></i> Remove</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times"></i> Close </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

