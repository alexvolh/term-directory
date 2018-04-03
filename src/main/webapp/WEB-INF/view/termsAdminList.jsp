<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container mt-5">
    <table id="myTable" class="table table-striped">
        <thead>
            <tr>
                <th>en term</th>
                <th>ua term</th>
                <th>ru term</th>
                <th>View</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${terms}" var="term">
                <tr>
                    <td>${term.english}</td>
                    <td>${term.ukraine}</td>
                    <td>${term.russian}</td>
                    <td>
                        <a href="<c:url value='/terms/term-${term.id}' />" class="btn btn-info custom-width">
                            <i class="fas fa-eye"></i>  View</a>
                    </td>
                    <td>
                        <a href="<c:url value='/terms/edit-term-${term.id}' />" class="btn btn-warning custom-width">
                            <i class="fas fa-edit"></i>  Edit</a>
                    </td>
                    <td>
                        <a href="<c:url value='/terms/delete-term-${term.id}' />" class="btn btn-danger custom-width">
                            <i class="fas fa-trash-alt"></i>  Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
