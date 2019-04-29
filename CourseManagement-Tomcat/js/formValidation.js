function validateAnnouncement()
{
    if(document.getElementById('announcementTitle').value == "")
    {
        alert("Subject line cannot be blank");
        return false;
    }
    if(document.getElementById('announcementContent').value == "")
    {
        alert("Announcement Content cannot be blank");
        return false;
    }
    if(/^\s+$/.test(document.getElementById('announcementContent').value))
    {
        alert("Announcement Content cannot be blank");
        return false;
    }
    return true;
}

function validateCourseMaterial()
{
    if(document.getElementById('materialTitle').value == "")
    {
        alert("Title of Course Material cannot be blank");
        return false;
    }
    if(document.getElementById('materialFile').value == "")
    {
        alert("You must upload a file");
        return false;
    }
    return true;
}

function validateAssessmentItemUpload()
{
    if(document.getElementById('assessmentItemName').value == "")
    {
        alert("Assessment Item Name cannot be blank");
        return false;
    }
    if(document.getElementById('assignmentFile').value == "")
    {
        alert("You must upload a file");
        return false;
    }
    if(document.getElementById('weight').value == "")
    {
        alert("Total weight cannot be blank");
        return false;
    }
    if(document.getElementById('weight').value >100 || document.getElementById('weight').value <= 0)
    {
        alert("Invalid Range. Please enter total weight (out of 100%)");
        return false;
    }
    if(document.getElementById('dueDate').value == "")
    {
        alert("Due Date cannot be blank");
        return false;
    }
    return true;
}

function validateAdverseRequest()
{
    if(document.getElementById('description').value == "" && document.getElementById('medicalFile').value=="" &&
        document.getElementById('otherFile').value == "")
    {
        alert("You cannot submit the form if all fields are blank. Please provide at least a description, or upload a file.");
        return false;
    }
    alert("Your application has been submitted. You will be notified of the outcome when it has been finalised.");
    return true;
}

function validateCreateGroup()
{
    if(document.getElementById('groupName').value == "")
    {
        alert("Group Name cannot be blank");
        return false;
    }
    return true;
}

function validateCreateForum()
{
    if(document.getElementById('forumName').value == "")
    {
        alert("Forum Name cannot be blank");
        return false;
    }
    return true;
}

function validateCreateThread()
{
    if(document.getElementById('threadName').value == "")
    {
        alert("Thread Name cannot be blank");
        return false;
    }
    if(document.getElementById('threadPost').value == "")
    {
        alert("Thread Post cannot be blank");
        return false;
    }
    return true;
}

function validateReply()
{
    if(document.getElementById('threadReply').value == "")
    {
        alert("Reply cannot be blank");
        return false;
    }
    return true;
}

function validateAssignmentSubmission()
{
    if(document.getElementById('submissionFile').value == "")
    {
        alert("Submission File cannot be blank");
        return false;
    }
    return true;
}

function validateChatMessage()
{
    if(document.getElementById('messageContent').value == "")
    {
        alert("You cannot send an empty message");
        return false;
    }
    return true;
}

function validatePeerEvaluationForm()
{
    alert("Reminder: Any contributions you have left blank will automatically be rated a 0. Any contibutions made over 100 will be automatically changed to 100.");
    return true;
}
