<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<section class="px-5 mt-3">
    <h1>Add New Term</h1>

    <form:form cssClass="mt-5" method="post" modelAttribute="term" enctype="multipart/form-data">
        <div class="row">
            <div class="col-sm-2">
                <label for="english" class="control-label newterm-labels">Term on English:</label>
            </div>
            <div class="col-md-7">
                <form:input type="text" class="form-control" name="english"
                            id="enlish" path="english" placeholder="English term"/>
            </div>
            <div class="has-error col-md-3">
                <form:errors path="english"/>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-2">
                <label for="russian" class="control-label newterm-labels">Term on Russian:</label>
            </div>
            <div class="col-md-7">
                <form:input type="text" class="form-control" name="english"
                            id="russian" path="russian" placeholder="Russian term"/>
            </div>
            <div class="has-error col-md-3">
                <form:errors path="russian"/>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-2">
                <label for="ukraine" class="control-label newterm-labels">Term on Ukrainian:</label>
            </div>
            <div class="col-md-7">
                <form:input type="text" class="form-control" name="english"
                            id="ukraine" path="ukraine" placeholder="Ukrainian term"/>
            </div>
            <div class="has-error col-md-3">
                <form:errors path="ukraine"/>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-2">
                <label for="transcription" class="control-label newterm-labels">Enter transcription:</label>
            </div>
            <div class="col-md-7">
                <form:input type="text" class="form-control" name="english"
                            id="transcription" path="transcription" placeholder="Transcription"/>
                <div id="keyboard" class="mt-2 newone" style=" background: #144766; border-radius: 10px"></div>
            </div>
            <div class="has-error col-md-3">
                <form:errors path="transcription" />
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-2">
                <label class="control-label newterm-labels">Choose subjects: <br/> (press "shift" or "ctrl" for multiple choose)
                </label>
            </div>
            <div class="col-md-7">
                <form:select cssClass="form-control" path="subjects">
                    <form:options items="${subjects}" itemValue="id" itemLabel="english" multiple="true"/>
                </form:select>
            </div>
            <div class="has-error">
                <form:errors path="subjects" class="help-inline p-3"/>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-2">
                <label class="control-label newterm-labels">Upload image:</label>
            </div>
            <div class="col-md-7">
                <div class="form-group">
                    <div class="file-loading">
                        <form:input id="term-file" class="file" accept=".jpg" type="file" name="termPic" path="multipartFile"/>
                    </div>
                </div>
            </div>
            <div class="has-error">
                <form:errors path="multipartFile" class="help-inline"/>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-2">
                <label for="description" class="control-label newterm-labels">Enter description:</label>
            </div>
            <div class="col-md-7">
                <form:textarea type="text" class="form-control" name="description"
                               id="description" path="description" placeholder="Description"/>
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
