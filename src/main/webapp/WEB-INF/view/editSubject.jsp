<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<section class="px-5 mt-3">
    <h1>Edit Subject</h1>

    <form:form cssClass="mt-5" method="post" modelAttribute="subject">
        <div class="row">
            <div class="col-sm-2">
                <label for="english" class="control-label newterm-labels">Subject on English:</label>
            </div>
            <div class="col-md-7">
                <form:input type="text" class="form-control" name="english"
                            id="enlish" path="english" placeholder="Subject on English"/>
            </div>
            <div class="has-error col-md-3">
                <form:errors path="english"/>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-2">
                <label for="ukraine" class="control-label newterm-labels">Subject on Ukrainian:</label>
            </div>
            <div class="col-md-7">
                <form:input type="text" class="form-control" name="english"
                            id="ukraine" path="ukraine" placeholder="Subject on Ukrainian"/>
            </div>
            <div class="has-error col-md-3">
                <form:errors path="ukraine"/>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-2">
                <label for="russian" class="control-label newterm-labels">Subject on Russian:</label>
            </div>
            <div class="col-md-7">
                <form:input type="text" class="form-control" name="english"
                            id="russian" path="russian" placeholder="Subject on Russian"/>
            </div>
            <div class="has-error col-md-3">
                <form:errors path="russian"/>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-2">
            </div>
            <div class="col-md-7 text-center">
                <button type="submit" class="btn btn-primary" style="font-size: 1.2em; width: 20%; height: 120%">
                    <i class="far fa-save"></i> <span class="ml-2">Save</span>
                </button>
            </div>
        </div>
    </form:form>
</section>
