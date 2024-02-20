<%@ Page Title="" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true"
    CodeBehind="ApplicantList.aspx.cs" Inherits="Praccum_New.Recruiter.ViewApplicantList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagName="NewsLetter" TagPrefix="Elite" Src="~/UserControls/ucNewsletter.ascx" %>
<%@ Register TagName="JSHeader" TagPrefix="Elite" Src="~/UserControls/JobSeekerHeader.ascx" %>
<%@ Register TagName="RecMenu" TagPrefix="Elite" Src="~/UserControls/ucRecruiterMenu.ascx" %>
<%@ Register TagName="Message" TagPrefix="Elite" Src="~/admin/UserControls/ucAdminMessage.ascx" %>
<%@ Register TagName="ListView" TagPrefix="Elite" Src="~/admin/UserControls/ucListView.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       PageMethods.set_path("/Recruiter/ViewApplicantList.aspx"); 
        //PageMethods.set_path("/Employer/Applicant/Fresher-CS--Semi-CS-required-at-Leading-CA-Firm-at-Ghatkopar/");trup
    </script>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.0.min.js" type="text/javascript"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js" type="text/javascript"></script>
    <link href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css" rel="Stylesheet" type="text/css" />

    <script type="text/javascript">
        function checkReqFields(sender, args) {
            //alert("checkReqFields");
            //var returnValue;
            var minCurSal = document.getElementById('<%= txtCurSal1.ClientID %>').value;
            var maxCurSal = document.getElementById('<%= maxcursal1.ClientID %>').value;

            //alert("min=" + minCurSal);
            //alert("max=" + maxCurSal);

            if (minCurSal == "" && maxCurSal != "") {
                //alert("Minimum CurrentSalary required");
                //minCurSal.innerHTML = "* required.";
                sender.innerHTML = "*Minimum CurrentSalary required";
                args.IsValid = false;
                //returnValue = false;
            }
            //return returnValue;
        }

        function checkReqFields1(sender, args) {
            //alert("checkReqFields");
            //var returnValue;
            var minCurSal = document.getElementById('<%= txtExpectedSal1.ClientID %>').value;
            var maxCurSal = document.getElementById('<%= maxexpsal1.ClientID %>').value;

            //alert("min=" + minCurSal);
            //alert("max=" + maxCurSal);

            if (minCurSal == "" && maxCurSal != "") {
                //alert("Minimum CurrentSalary required");
                //minCurSal.innerHTML = "* required.";
                sender.innerHTML = "*Minimum ExpectedSalary required";
                args.IsValid = false;
                //returnValue = false;
            }
            //return returnValue;
        }
    </script>

   <script type="text/javascript">
        //$(function () {
        $(document).ready(function () {
            $("[id$=txtSubLocation]").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: '<%=ResolveUrl("~/Recruiter/ApplicantList.aspx/GetSubLocations") %>',
                        data: "{ 'prefix': '" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            if (data.d.length > 0) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item.split('-')[0],
                                        val: item.split('-')[1]
                                    }
                                }))
                            } else {
                                //If no records found, set the default "No match found" item with value -1.
                                response([{ label: 'No results found.', val: -1 }]);
                                //alert('Option must be selected from the list.');
                            }
                        },
                        error: function (response) {
                            alert(response.responseText);
                        },
                        failure: function (response) {
                            alert(response.responseText);
                        }
                    });
                },
                select: function (e, u) {

                    // If the No match found" item is selected, clear the TextBox.
                    if (u.item.val == -1) {
                        //Clear the AutoComplete TextBox.
                        $(this).val("");
                        return false;
                    }
                    else {
                        //alert($("[id$=hdnDegree]").val());
                        $("[id$=hdnValue]").val(u.item.val);
                        //alert($("[id$=hdnDegree]").val());
                    }
                },
                minLength: 1,
                change: function (event, ui) {
                    if (ui.item == null) {
                        //here is null if entered value is not match in suggestion list
                        $(this).val((ui.item ? ui.item.id : ""));
                    }
                }
            });
        });
    </script>

    <script type="text/javascript">

        //$(function () {
        $(document).ready(function () {
            $("[id$=txtOtherProDegree]").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: '<%=ResolveUrl("~/Recruiter/ApplicantList.aspx/GetOtherDegrees") %>',
                        data: "{ 'prefix': '" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            if (data.d.length > 0) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item.split('-')[0],
                                        val: item.split('-')[1]
                                    }
                                }))
                            } else {
                                //If no records found, set the default "No match found" item with value -1.
                                response([{ label: 'No results found.', val: -1 }]);
                                //alert('Option must be selected from the list.');
                            }
                        },
                        error: function (response) {
                            alert(response.responseText);
                        },
                        failure: function (response) {
                            alert(response.responseText);
                        }
                    });
                },
                select: function (e, u) {

                    // If the No match found" item is selected, clear the TextBox.
                    if (u.item.val == -1) {
                        //Clear the AutoComplete TextBox.
                        $(this).val("");
                        return false;
                    }
                    else {
                        //alert($("[id$=hdnDegree]").val());
                        $("[id$=hdnDegree]").val(u.item.val);
                        //$("[id$=txtOtherProDegree]").val(i.item.val);
                        //alert($("[id$=hdnDegree]").val());
                    }
                },
                minLength: 1,
                change: function (event, ui) {
                    if (ui.item == null) {
                        //here is null if entered value is not match in suggestion list
                        $(this).val((ui.item ? ui.item.id : ""));
                    }
                }
            });
        });
    </script>

    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            if (document.getElementById('<%=hdnIsAdvance.ClientID %>').value == '1')
                $('.advance').hide('fast');
            $('#lnkAdvance').click(function () {
                $('.advance').toggle('fast');
                if ($('#lnkAdvance').text() == 'Show Advance Options') {
                    $('#lnkAdvance').html('Hide Advance Options');
                    document.getElementById('<%=hdnIsAdvance.ClientID %>').value = '1';
                }
                else {
                    $('#lnkAdvance').html('Show Advance Options');
                    document.getElementById('<%=hdnIsAdvance.ClientID %>').value = '0';
                }
            });
        });

        function numericFormat(fld, e, extraStrCheck) {
            var sep = 0;
            var key = '';
            var i = j = 0;
            var len = len2 = 0;
            var strCheck = '0123456789';
            if (extraStrCheck)
                strCheck += extraStrCheck;
            var aux = aux2 = '';
            var whichCode = (window.Event) ? e.which : e.keyCode;

            if (whichCode == 13) return true;  // Enter
            if (whichCode == 8) return true;  // Backspace
            if (whichCode == 0) return true;  // Null
            if (whichCode == 9) return true;  // Tab

            key = String.fromCharCode(whichCode);  // Get key value from key code
            if (strCheck.indexOf(key) == -1) return false;  // Not a valid key
            var x = new String(fld.value);
            if (key == '.') {
                var exp = /\./;
                var a = x.search(exp);
                if (a != -1) return false;
            }


        }

        function allow2decimal(obj) {
            var v = parseFloat($(obj).val());



            if (isNaN(v)) {
                $(obj).value = '';
            } else {
                newVal = v.toFixed(2);
                if (newVal >= 100) {
                    $(obj).val(100);
                } else {
                    $(obj).val(newVal);
                }

            }

        }

        function changestatus(obj, JobApplicationID, JobSeekerName, JobTitle, jobcode) {
            //alert("viewchange status");
            var CompanyName, ContactPersonName, ContactDesignation, CompanyAddress;
            // debugger;
            var IsUpdate = false;
            if (obj.value == '-1') {
              //  alert("rejected");
                if (confirm('Do you want to hide the candidate from the Applicant List?')) {
                    obj.style.display = 'none';
                    obj.nextElementSibling.style.display = 'inline-block';
                    obj.nextElementSibling.className = "fa fa-spinner fa-spin";
                    IsUpdate = true;
                } else {
                    //alert("Trup: -1 Else ");
                    obj.nextElementSibling.style.display = 'inline-block';
                    obj.nextElementSibling.className = "fa fa-spinner fa-spin";
                    IsUpdate = true;
                }
            }
            else if (obj.value == '3') {
                //alert("Trup: 3 ");
                if (confirm('Do you want to hide the candidate from the Applicant List?')) {
                    obj.style.display = 'none';
                    obj.nextElementSibling.style.display = 'inline-block';
                    obj.nextElementSibling.className = "fa fa-spinner fa-spin";
                    IsUpdate = true;
                } else {
                    //alert("Trup: 3 else ");
                    obj.nextElementSibling.style.display = 'inline-block';
                    obj.nextElementSibling.className = "fa fa-spinner fa-spin";
                    IsUpdate = true;
                }
            }

            else if (obj.value == '1') {
                //alert("Trup: 1 ");
                <% if (drRecruiterDetail != null)
        { %>
                CompanyName = '<%=drRecruiterDetail["CompanyName"].ToString() %> ';
                ContactPersonName ='<%=drRecruiterDetail["ContactPerson"].ToString() %>';
                ContactDesignation = '<%=drRecruiterDetail["Designation"].ToString() %>';
                    <%--interviewvenue = '<%=dtJob.Rows[0]["InterviewVenue"].ToString() %>';
                    interviewdate = '<%=dtJob.Rows[0]["InterviewDate"].ToString() %>';
                    jobcode = '<%=dtJob.Rows[0]["JobCode"].ToString() %>';--%>
                CompanyAddress ='<%=drRecruiterDetail["Address"].ToString().Replace("\r\n","<br/>") %>';
                if (confirm('Do you want to send an email to the candidate informing him/her that he/she is shortlisted?')) {
                    document.getElementById('Background').style.display = "block";
                    document.getElementById('Progress').style.display = "block";
                    var elem = document.getElementById('btnSend');
                    elem.addEventListener('click', function () { SendJobseekerMail(obj); }, false);
                    var elembtnClose = document.getElementById('btnClose');
                    elembtnClose.addEventListener('click', function () { closeoverlay(obj); }, false);
                    obj.style.display = 'none';
                    obj.nextElementSibling.style.display = 'inline-block';
                    obj.nextElementSibling.className = "fa fa-spinner fa-spin";

                    var mailbody ='<%=MailBody%>';
                    var mailsubject ='<%=MailSubject %>';
                    debugger;
                    mailbody = mailbody.replace("$$JOBSEEKERFULLNAME$$", JobSeekerName);
                    mailbody = mailbody.replace("$$JOBTITLE$$", JobTitle);
                    mailbody = mailbody.replace("$$COMPANYNAME$$", CompanyName);
                    mailbody = mailbody.replace("$$CONTACT_PERSON_NAME$$", CompanyName + "\n");
                    //mailbody=mailbody.replace("$$DSEIGNATION$$",ContactDesignation+"\n");
                    mailbody = mailbody.replace("$$DSEIGNATION$$", "");
                    mailbody = mailbody.replace("$$ADDRESS$$", CompanyAddress);
                    //mailbody = mailbody.replace("$$time$$ ", interviewvenue + " " + interviewdate);
                    ////mailbody = mailbody.replace("$$ADDRESS$$", interviewdate);
                    mailbody = mailbody.replace("$$JOBCODE$$", jobcode);
                    var find = '<br/>';
                    var re = new RegExp(find, 'g');
                    mailbody = mailbody.replace(re, "\n");

                    document.getElementById("<%=txtMailBody.ClientID %>").value = mailbody;
                    document.getElementById("<%=txtMailSubject.ClientID %>").value = mailsubject;

                    document.getElementById("<%=hdnJobApplicationID.ClientID %>").value = JobApplicationID;
                    document.getElementById("<%=hdnobjId.ClientID %>").value = obj.id;
                        <%} %>
                    IsUpdate = true;
                }
                else {
                    obj.style.display = 'inline-block';
                    obj.nextElementSibling.style.display = 'none';
                    obj.nextElementSibling.className = "fa fa-cross";
                    IsUpdate = true;

                }
            }
            else {
                obj.style.display = 'none';
                obj.nextElementSibling.style.display = 'inline-block';
                obj.nextElementSibling.className = "fa fa-spinner fa-spin";
                IsUpdate = true;
            }
            if (IsUpdate) {
               // alert("isupdatetrue");
                //alert(document.URL);
              // window.location.href = "http://localhost:7122/Employer/Applicant/";
                //alert(window.location.href.toString());
                PageMethods.UpdateJobStatus(obj.value, JobApplicationID, onSucess, onError);
                
                function onSucess(result) {
                    obj.style.display = 'inline-block';
                    obj.nextElementSibling.className = "fa fa-check";
                    // window.location.reload();
                    // obj.parentNode.nextElementSibling.style.display = "block";
                    //  obj.parentNode.nextElementSibling.src = "/images/sign_tick.png";

                }
                function onError(result) {
                    obj.style.display = 'inline-block';

                    obj.nextElementSibling.className = "fa fa-cross";
                    //   obj.parentNode.nextElementSibling.src = "/images/chk_off.png";

                }

                
               <%-- $.ajax({
                        url: '<%=ResolveUrl("~/admin/Jobseeker/JobseekerList.aspx/GetSubLocations") %>',
                        data: "{ 'prefix': '" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        alert(data);
                            if (data.d.length > 0) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item.split('-')[0],
                                        val: item.split('-')[1]
                                    }
                                }))
                            } else {
                                alert("xxx");
                                //If no records found, set the default "No match found" item with value -1.
                                response([{ label: 'No results found.', val: -1 }]);
                                //alert('Option must be selected from the list.');
                            }
                        },
                        error: function (response) {
                            alert(response.responseText);
                        },
                        failure: function (response) {
                            alert(response.responseText);
                        }
                });--%>

                //$.ajax({
                //    type: "POST",
                //    url: "ApplicantList.aspx/UpdateJobStatus",
                //    data: '{"ddlStatus":"' + obj.value + '", "JobApplicationID":"' + JobApplicationID + '"}',
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    success: function (response) {
                //        obj.style.display = 'inline-block';
                //        obj.nextElementSibling.className = "fa fa-check";
                //         window.location.reload();

                //    },
                //    error: function (response) {
                //        obj.style.display = 'inline-block';

                //        obj.nextElementSibling.className = "fa fa-cross";

                //    },
                //});


            }
        }

        function changestatusCheckbox(obj, JobApplicationID, JobSeekerName, JobTitle, jobcode) {
            // alert("Rut: " + obj.value);
            //alert("Rut JobApplicationID: " + JobApplicationID);
            //alert("Rut: " + JobSeekerName);
            //alert("Rut: " + JobTitle);
            //alert("Rut: " + jobcode);
            var CompanyName, ContactPersonName, ContactDesignation, CompanyAddress;
            // debugger;
            var IsUpdate = false;
            //var flg = true;
            if (obj.value == '-1') {
                //alert("Trup: -1 ");
                //var success = confirm('Do you want to hide the candidate from the Applicant List?');
                if (confirm('Do you want to hide the candidate from the Applicant List?')) {
                    $('#ctl00_ContentPlaceHolder1_ucListView_tablesorter input:checkbox:checked').each(function () {
                        // alert("checkbox count =" + $('#ctl00_ContentPlaceHolder1_ucListView_tablesorter input:checkbox:checked').length);
                        IsUpdate = true;
                    });
                }
                else { //alert("Trup: -1 Else ");
                    $('#ctl00_ContentPlaceHolder1_ucListView_tablesorter input:checkbox:checked').each(function () {

                        IsUpdate = true;
                        //flg = false;
                    });
                }
            }
            else if (obj.value == '3') {
                //alert("Trup: 3 ");
                if (confirm('Do you want to hide the candidate from the Applicant List?')) {
                    $('#ctl00_ContentPlaceHolder1_ucListView_tablesorter input:checkbox:checked').each(function () {
                        IsUpdate = true;
                    });
                } else {
                    $('#ctl00_ContentPlaceHolder1_ucListView_tablesorter input:checkbox:checked').each(function () {
                        IsUpdate = true;
                    });
                }
            }

            else if (obj.value == '1') {
                $('#ctl00_ContentPlaceHolder1_ucListView_tablesorter input:checkbox:checked').each(function () {
                    IsUpdate = true;
                });
            }
            else {
                $('#ctl00_ContentPlaceHolder1_ucListView_tablesorter input:checkbox:checked').each(function () {
                    IsUpdate = true;
                });
            }

            if (IsUpdate) {
                //alert("IsUpdate=" + IsUpdate);
                //alert("checkbox count =" + $('#ctl00_ContentPlaceHolder1_ucListView_tablesorter input:checkbox:checked').length);
                sendAsyncRequestTosetSession('STATUS_UPDATE', obj.value);
            }
        }
        function SendJobseekerMail(ddl) {

            PageMethods.SendMail(document.getElementById("<%=hdnJobApplicationID.ClientID %>").value, document.getElementById("<%=txtMailSubject.ClientID %>").value, document.getElementById("<%=txtMailBody.ClientID %>").value, onSucess, onError);
            function onSucess(result) {
                document.getElementById(document.getElementById("<%=hdnobjId.ClientID %>").value).parentNode.nextElementSibling.style.display = "block";
                document.getElementById(document.getElementById("<%=hdnobjId.ClientID %>").value).parentNode.nextElementSibling.src = "/images/sign_tick.png";
                ddl.style.display = 'inline-block';
                ddl.nextElementSibling.className = "fa fa-check";
                closeoverlay();
            }
            function onError(result) {
                document.getElementById(document.getElementById("<%=hdnobjId.ClientID %>").value).parentNode.nextElementSibling.src = "/images/chk_off.png";
                ddl.style.display = 'inline-block';
                ddl.nextElementSibling.className = "fa fa-cross";
                closeoverlay();
            }
        }
        function closeoverlay() {
            $('.Background').hide();
            $('.Progress').hide();
        }
        function closeoverlay(obj) {
            $('.Background').hide();
            $('.Progress').hide();
            if (obj != null) {
                obj.style.display = 'inline-block';
                obj.nextElementSibling.style.display = 'none';
                obj.nextElementSibling.className = "fa fa-cross";
                obj.value = '0';
            }
        }
        function ViewJobSeeker(srcpath) {
            debugger
            document.getElementById('frmPrintJS').width = '690px';
            document.getElementById('frmPrintJS').src = srcpath;
            document.getElementById('divBackGroundViewApplicant').style.display = 'block';
            document.getElementById('divContainerViewApplicant').style.display = 'block';

        }
        function resizeIframe(obj) {

            ////obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
            obj.style.width = obj.contentWindow.document.body.scrollwidth + 'px';
        }



    </script>
    <style>
        .Background {
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
            background-color: #F5F4F4;
            filter: alpha(opacity=80);
            opacity: 0.8;
            position: fixed;
            width: 100%;
            height: 100%;
            z-index: 100;
            display: none;
        }

        .closebutton {
            cursor: pointer;
            float: right;
            margin: 0 20px;
        }

        .printbutton {
            cursor: pointer;
            float: left;
            margin: 0 20px;
        }
    </style>
    <!-- Bootstrap 3.3.2 -->
    <link href="/admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- FontAwesome 4.3.0 -->
    <link href="/admin/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons 2.0.0 -->
    <link href="/admin/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/admin/css/AdminLTE.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/admin/css/skins/_all-skins.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="/admin/css/flat/blue.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="/admin/css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Date Picker -->
    <link href="/admin/css/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="/admin/css/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link href="/admin/css/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="headercontent" runat="server">
    <Elite:JSHeader ID="ucJSHeader" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 left-side-content">
            <div class="main-titlhead">
                <!------------ start left content ---------->
                <span class="inn-sec-ttl">View Applicant
                    List</span>

                <!------------ close right sidebar ---------->
                <Elite:RecMenu ID="ucRecMenu" runat="server" />
                <hr />
                <div class="clearfix">
                </div>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="view-dt-div">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <asp:DropDownList ID="ddlPastJob" runat="server" OnSelectedIndexChanged="ddlPastJob_SelectedIndexChanged"
                                AutoPostBack="true" CssClass="form-control" CausesValidation="false">
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 txtfralg">
                            <p>
                                View Closed Jobs? <a href="javascript://">Contact Support</a>
                            </p>
                        </div>
                        <br />
                        <%--<% if (drData != null)
                            { %>
                        <h1 class="slefind-ttl">
                            <%=drjob["Title"].ToString()%></h1>
                        <dl class="dl-horizontal">
                            <dt>Date : </dt>
                            <dd>
                                <%=drjob["JobDate"].ToString()%>
                            </dd>
                            <dt>Designation : </dt>
                            <dd>
                                <%=drjob["Designation"].ToString()%>
                            </dd>
                            <dt>Category: </dt>
                            <dd>
                                <%=drjob["CategoryName"].ToString()%>
                            </dd>
                            <dt>Opportunity : </dt>
                            <dd>
                                <%=drjob["JobSubCategories"].ToString()%>
                            </dd>
                            <dt>No of Openings : </dt>
                            <dd>
                                <%=drjob["TotalOpening"].ToString()%>
                            </dd>
                        </dl>
                        <%} %>--%>
                        <div class="text-right">
                            <a href="/JobDetail.aspx?ID=<%= EncodeString.EncodeString.Encode(ID.ToString()) %>"
                                class="btn veiwjob-a">View Job</a>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <%-- kinjal--%>
            <%--<div class="row">--%>

            <div class="col-xs-12 col-sm-3">
                <label for="exampleInputEmail1"class="label-txt-blue">
                    Name</label>
                <asp:TextBox ID="txtNameApplist" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
            </div>
            <%-- Name--%>
            <div class="col-xs-12 col-sm-3">
                <label for="exampleInputEmail1"class="label-txt-blue">
                    Email</label>
                <asp:TextBox ID="txtemailApplist" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
            </div>
            <%--Email--%>
            <div class="col-xs-12 col-sm-3">
                <label for="exampleInputEmail1"class="label-txt-blue">
                    Mobile No.</label>
                <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="Mobile No" MaxLength="10" onkeypress="return IsValidMobile(event,this);"></asp:TextBox>
            </div>
            <%--Mobile No--%>
            <div class="col-xs-12 col-sm-3">
                <label for="exampleInputEmail1"class="label-txt-blue">
                    Nature Of Jobseeker</label>

                <asp:DropDownList ID="ddlNatureof" runat="server" CssClass="form-control">
                    <asp:ListItem Text="--Select--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Actively Looking" Value="Activly Looking"></asp:ListItem>
                    <asp:ListItem Text="Passively Looking" Value="Passively Looking"></asp:ListItem>
                    <asp:ListItem Text="Not Looking" Value="Not Looking"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <%--     Nature Of Jobseeker--%>
            <br />
            <br />
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <label for="exampleInputEmail1" class="label-txt-blue">
                    Sub Category</label>
                <asp:CheckBoxList ID="chkNature" RepeatDirection="Vertical" RepeatColumns="2" CssClass="radiolist200"
                    CellPadding="1" runat="server" Width="100%">
                    <asp:ListItem Text="Articleship/Internship" Value="Articleship/Internship">Articleship</asp:ListItem>
                    <asp:ListItem Text="Job (Qualified)" Value="Job Qualified">Job (Qualified)</asp:ListItem>
                    <asp:ListItem Text="Job(Semi qualified)" Value="Job Semi qualified">Job (Semi qualified )</asp:ListItem>
                    <asp:ListItem Text="Freelancer" Value="Freelancer">Freelancer</asp:ListItem>
                </asp:CheckBoxList>
            </div>
            <%--Sub Category--%>


            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <label for="exampleInputEmail1" class="label-txt-blue">
                    Nature of Openings</label>
                <asp:CheckBoxList ID="chkjobcategory" RepeatDirection="vertical" RepeatColumns="2"
                    CssClass="radiolist200" runat="server">
                </asp:CheckBoxList>
            </div>
            <%--Nature of Openings--%>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <label for="exampleInputEmail1" class="label-txt-blue">
                    Years of Experience</label>
                <asp:CheckBoxList ID="chkYearsofexp" runat="server" RepeatDirection="vertical" RepeatColumns="2" CssClass="radiolist200"
                    CellPadding="5" Width="100%">

                    <asp:ListItem Text="Fresher" Value="Fresher"></asp:ListItem>
                    <asp:ListItem Text="3 to 11 months" Value="3 to 11 months"></asp:ListItem>
                    <asp:ListItem Text="2 to 4 years" Value="2 to 4 years"></asp:ListItem>
                    <asp:ListItem Text="5 to 7 years" Value="5 to 7 years"></asp:ListItem>
                    <asp:ListItem Text="8 to 10 years" Value="8 to 10 years"></asp:ListItem>
                    <asp:ListItem Text="11 to 15 years" Value="11 to 15 years"></asp:ListItem>
                    <asp:ListItem Text="15 years & above" Value="15 years & above"></asp:ListItem>
                </asp:CheckBoxList>
            </div>
            <%--Years of Experience--%>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <label for="exampleInputEmail1" class="label-txt-blue">
                    Notice Period </label>
                <asp:CheckBoxList ID="chkNoticePeriod" runat="server" RepeatDirection="vertical" RepeatColumns="2" CssClass="radiolist200"
                    CellPadding="5" Width="100%">
                    <asp:ListItem Text="Immediate" Value="Immediate"></asp:ListItem>
                    <asp:ListItem Text="7 days" Value="7 days"></asp:ListItem>
                    <asp:ListItem Text="15 days" Value="15 days"></asp:ListItem>
                    <asp:ListItem Text="30 days" Value="30 days"></asp:ListItem>
                    <asp:ListItem Text="60 days" Value="60 days"></asp:ListItem>
                    <asp:ListItem Text="90 days" Value="90 days"></asp:ListItem>
                </asp:CheckBoxList>
            </div>

            <%--Notice Period--%>

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <label for="exampleInputEmail1" class="label-txt-blue">
                    Current Salary Range</label>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="col-xs-6">
                        <label for="exampleInputEmail1">
                            From</label>
                        <asp:TextBox ID="txtCurSal1" runat="server" class="form-control" onkeypress="return numericFormat( this , event , '.');" onchange="allow2decimal(this)" placeholder="Minimum range"></asp:TextBox>
                    </div>
                    <div class="col-xs-6">
                        <label for="exampleInputEmail1">
                            To
                        </label>
                        <asp:TextBox ID="maxcursal1" runat="server" class="form-control" placeholder="Maximum range " onkeypress="return numericFormat( this , event , '.');" onchange="allow2decimal(this)"></asp:TextBox>
                        <asp:CustomValidator runat="server" Display="Dynamic"
                            ForeColor="Red" ClientValidationFunction="checkReqFields" ErrorMessage=""></asp:CustomValidator>
                    </div>
                </div>
            </div>
            <%--Current Salary Range--%>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <label for="exampleInputEmail1" class="label-txt-blue">
                    Expected Salary Range</label>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="col-xs-6">
                        <label for="exampleInputEmail1">
                            From</label>
                        <asp:TextBox ID="txtExpectedSal1" runat="server" class="form-control" placeholder="Minimum range" onkeypress="return numericFormat( this , event , '.');" onchange="allow2decimal(this)"></asp:TextBox>
                    </div>
                    <div class="col-xs-6">
                        <label for="exampleInputEmail1">
                            To
                        </label>
                        <asp:TextBox ID="maxexpsal1" runat="server" class="form-control" placeholder="Maximum range " onkeypress="return numericFormat( this , event , '.');" onchange="allow2decimal(this)"></asp:TextBox>
                        <asp:CustomValidator runat="server" Display="Dynamic"
                            ForeColor="Red" ClientValidationFunction="checkReqFields1" ErrorMessage=""></asp:CustomValidator>
                    </div>


                </div>
            </div>
            <%--Expected Salary Range--%>
            <br />
            <div class="col-sm-3 xs-12 ">
                <label for="exampleInputEmail1" class="label-txt-blue">
                    Completed Highest Degrees
                </label>
                <asp:TextBox ID="txtOtherProDegree" runat="server" class="form-control" placeholder="select from Auto-suggestions"></asp:TextBox>
                <asp:HiddenField ID="hdnDegree" runat="server" Value="0" />
            </div>
            <%--Other Degrees--%>
            <div class="col-sm-3 xs-12 ">
                <label for="exampleInputEmail1" class="label-txt-blue">
                    Search by City
                </label>
                <%--<asp:CheckBox ID="chkcity" runat="server" Text="Search in City" />--%>
                <asp:DropDownList ID="ddlocation" runat="server" CssClass="form-control" />
            </div>
            <%--city--%>
            <div class="col-sm-3 xs-12 ">
                <label for="exampleInputEmail1" class="label-txt-blue">
                    Search by Area within City</label>

                <asp:TextBox ID="txtSubLocation" runat="server" class="form-control" placeholder="Select from Auto-suggestion "></asp:TextBox>
                <asp:HiddenField ID="hdnValue" runat="server" Value="0" />
            </div>
            <%--Search in Sublocation--%>
            <div class="col-sm-3 xs-12 ">
                <label for="exampleInputEmail1" class="label-txt-blue">
                    CV Uploaded ?</label>
                <asp:DropDownList ID="ddlCV" runat="server" CssClass="form-control">
                    <asp:ListItem Text="-Select-" Value="-1">
                    </asp:ListItem>
                    <asp:ListItem Text="Yes" Value="1">
                    </asp:ListItem>
                    <asp:ListItem Text="No" Value="0">
                    </asp:ListItem>
                </asp:DropDownList>
            </div>
            <%--  cv--%>
            <%--</div>--%>

            <%--</div>--%>

           
            <br />



            <br />


        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-xs-12">
                <label for="exampleInputEmail1">
                    &nbsp;</label><br />

                <a href="javascript://" id="lnkAdvance" class="label-txt-blue" style="background-color: wheat !important; font-size: 18px !important;">Show Advance Options</a>
                <asp:HiddenField ID="hdnIsAdvance" runat="server" Value="1" />
            </div>
        </div>
        <%--Show Advance Options--%>

        <div class="box advance">

            <div class="box-header">
                <h3 class="box-title"></h3>
            </div>

             <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                

<div class="panel-group" id="accordion1" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default" style="border: none !important;">
                            <div class="panel-heading" role="tab" id="headingOne1">
                                <h4 class="panel-title">
                                    <label class="label-txt-blue">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#Audit" aria-expanded="true"
                                            aria-controls="Audit" style="color:#243547 !important;">Select Profile preference<span style="font-size: 12px; font-weight: normal"></span> <span class="fa fa-angle-down pull-right"></span></a>
                                    </label>
                                </h4>
                            </div>
                            <div id="Audit" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne1">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="table-responsive">
                                        <asp:CheckBoxList ID="chkProfilePreferance" RepeatDirection="Vertical" runat="server" 
                                            RepeatColumns="4" CssClass="radiolist200 table-condensed" Width="100%">
                                        </asp:CheckBoxList>
                                        <asp:CustomValidator runat="server" ID="CustomValidator2" ClientValidationFunction="ValidateprofileList"
                                            ErrorMessage="Please Select Atleast one preference and maximum Four Preferance only" Display="Dynamic" ValidationGroup="BtnStep2"></asp:CustomValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                
                            </div>
                        </div>
            <%--Profile Preference--%>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default" style="border: none !important;">
                            <div class="panel-heading" role="tab" id="headingOne2">
                                <h4 class="panel-title">
                                    <label class="label-txt-blue">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion2" href="#Industry" aria-expanded="true"
                                            aria-controls="Industry" style="color:#243547 !important;">Select the key industries in which you have experience<span class="fa fa-angle-down pull-right"></span></a>
                                    </label>
                                </h4>
                            </div>
                            <div id="Industry" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne2">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="table-responsive">
                                        <asp:CheckBoxList ID="chkIndustry" RepeatDirection="Vertical" runat="server"
                                            RepeatColumns="4" CssClass="radiolist200 table-condensed" Width="100%">
                                        </asp:CheckBoxList>
                                        <asp:CustomValidator runat="server" ID="CustomValidator1" ClientValidationFunction="ValidateIndustry"
                                            ErrorMessage="Please Select Atleast one Industry and maximum Four Industries only" Display="Dynamic" ValidationGroup="BtnStep2"></asp:CustomValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <%--industry--%>
            <br />
            <div class="row">

                <div class="col-xs-6 col-sm-3">
                    <label for="exampleInputEmail1"class="label-txt-blue">
                        Leave For Exam</label>
                    <asp:DropDownList ID="ddlexamleave" runat="server" CssClass="form-control">
                        <asp:ListItem Text="--Select--" Value="-1" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Not giving exam" Value="Not giving exam"></asp:ListItem>
                        <asp:ListItem Text="Only exam days" Value="Only exam days"></asp:ListItem>
                        <asp:ListItem Text="15 days" Value="15 days"></asp:ListItem>
                        <asp:ListItem Text="30 days" Value="30 days"></asp:ListItem>
                        <asp:ListItem Text="45 days" Value="45 days"></asp:ListItem>
                        <asp:ListItem Text="60 days" Value="60 days"></asp:ListItem>

                    </asp:DropDownList>
                </div>
                <%--Leave For Exam--%>
                <div class="col-xs-6 col-sm-3">

                    <label for="exampleInputEmail1"class="label-txt-blue">
                        Nature of company</label>
                    <asp:DropDownList ID="ddcompany" runat="server" CssClass="form-control">
                        <asp:ListItem Text="--Select--" Value="-1" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Fresher" Value="Fresher"></asp:ListItem>
                        <asp:ListItem Text="CA/CS firm" Value="CA/CS firm"></asp:ListItem>
                        <asp:ListItem Text="Corporate" Value="Corporate"></asp:ListItem>
                    </asp:DropDownList>



                </div>
                <%--Nature of company--%>
                <div class="col-xs-6 col-sm-3">
                    <label for="exampleInputEmail1"class="label-txt-blue">
                        Gender</label>

                    <asp:DropDownList ID="ddlgender" runat="server" CssClass="form-control">
                        <asp:ListItem Text="--Select--" Value="-1" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <%--Gender--%>
                <div class="col-xs-6 col-sm-3">
                    <label for="exampleInputEmail1"class="label-txt-blue">
                        Number of jobs applied</label>
                    <asp:TextBox ID="txtTotalJobApply" runat="server" class="form-control" placeholder="Number of jobs applied "></asp:TextBox>
                </div>
                <%--Total Job Apply--%>
            </div>
            <br />
            <div class="row">


                <%--<div class="col-xs-6 col-sm-3 ">
                    <label for="exampleInputEmail1">
                        Graduation Year</label>
                    <asp:TextBox ID="Txtyrofgrad" runat="server" class="form-control" placeholder="year of passing graduation" onkeypress="return numericFormat( this , event , '.');"></asp:TextBox>
                </div>--%>
                <%--graduation year--%>
                <%-- <div class="col-xs-6 col-sm-3">
                    <label for="exampleInputEmail1">
                        Post Graduation Year</label>
                    <asp:TextBox ID="TxtyrofPG" runat="server" class="form-control" autocomplete="off" placeholder="year of passing post graduation" onkeypress="return numericFormat( this , event , '.');"></asp:TextBox>
                </div>--%>
                <%--Post Graduation Year--%>
                <%--  <div class="col-xs-6 col-sm-3">
                    <label for="exampleInputEmail1">
                        College Name</label>
                    <asp:TextBox ID="txtcollege" runat="server" class="form-control" placeholder="college name "></asp:TextBox>

                </div>--%>
                <%--College Name--%>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-6 col-sm-3">
                    <label for="exampleInputEmail1"class="label-txt-blue">
                        Registered Between</label>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <asp:TextBox ID="Txtregbetw" runat="server" class="form-control pull-right" autocomplete="off" AutoCompleteType="Disabled" placeholder="Select date range"></asp:TextBox>
                    </div>
                </div>
                <%--Registered Between--%>
                <%--<div class="col-xs-6 col-sm-3">
                    <label for="exampleInputEmail1">
                        Last Login Date</label>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <asp:TextBox ID="txtLastLoginDate" runat="server" class="form-control" placeholder="e.g. 26 Sep 2020"></asp:TextBox>
                        <asp:Calendar ID="calLastLoginDate" runat="server" Visible="false"></asp:Calendar>
                    </div>
                </div>--%>
                <%--Last Login Date--%>
                <%--<div class="col-xs-6 col-sm-3">
                    <label for="exampleInputEmail1">
                        DOJ</label>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <asp:TextBox ID="txtDOJ" runat="server" class="form-control" placeholder="e.g. 01 Sep 2020"></asp:TextBox>
                    </div>
                </div>--%>
                <%--DOJ--%>
                <div class="col-xs-6 col-sm-3">
                    <label for="exampleInputEmail1"class="label-txt-blue">
                        Active between</label>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <asp:TextBox ID="txtActiveIn" runat="server" class="form-control pull-right" autocomplete="off" AutoCompleteType="Disabled" placeholder="Select date range"></asp:TextBox>
                    </div>
                    <input id="handleAutofillProb" type="text" style="visibility: visible; width: 0px; height: 0px;" value="" />
                </div>
                <%-- Active In --%>
            </div>
            <br />
            <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="panel-group" id="accordionCat" role="tablist" aria-multiselectable="true">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingOneCat">
                                            <h4 class="panel-title">
                                                <label class="label-txt-blue">
                                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionCat" href="#AuditCat" aria-expanded="true"
                                                        aria-controls="AuditCat" style="color: #243547 !important;">Skills<%--<span style="font-size: 12px; font-weight: normal">(You can select maximum six options)</span>--%> <span class="fa fa-angle-down pull-right"></span></a>
                                                    
                                                </label>
                                            </h4>
                                        </div>
                                        <div id="AuditCat" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOneCat">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="table-responsive">
                                                    <asp:CheckBoxList ID="Chkskills" RepeatDirection="Vertical" runat="server"
                                                        RepeatColumns="4" CssClass="radiolist200 table-condensed" Width="100%">
                                                    </asp:CheckBoxList>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

            <br />
            <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="panel-group" id="accordionSubCat" role="tablist" aria-multiselectable="true">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingOneSubCat">
                                            <h4 class="panel-title">
                                                <label class="label-txt-blue">
                                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionSubCat" href="#AuditSubCat" aria-expanded="true"
                                                        aria-controls="AuditSubCat" style="color: #243547 !important;">Sub Skills<span class="fa fa-angle-down pull-right"></span></a>
                                                </label>
                                            </h4>
                                        </div>
                                        <div id="AuditSubCat" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOneSubCat">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="table-responsive">
                                                    <asp:CheckBoxList ID="ChkSubSkills" RepeatDirection="Vertical" runat="server"
                                                        RepeatColumns="4" CssClass="radiolist200 table-condensed" Width="100%">
                                                    </asp:CheckBoxList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <input type="submit" class="btn-frm post-btn" name="button" id="btnSearch" value="Search"
                    runat="server" onserverclick="btnSearch_ServerClick" />
                <asp:Button type="submit" name="button" runat="server" Text="Reset" class="btn-frm save-btn"
                    ID="btnReset" OnClick="btnResetSearch_ServerClick" CausesValidation="false" />
            </div>
        </div>
    </div>


    <%--<div class="col-xs-4">
                            <asp:TextBox ID="txtNameApplist" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                        </div>--%>
    <%--<div class="col-xs-4">
                            <asp:TextBox ID="txtemailApplist" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                        </div>--%>

    <%--<ul class="cate-input-list text-center">
                            <li>
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlJobStatus1" class="form-control" runat="server">
                                        <asp:ListItem Text="All" Value="">--Select Jobseeker Status--</asp:ListItem>
                                        <asp:ListItem Text="Pending" Value="0">Pending</asp:ListItem>
                                        <asp:ListItem Text="Rejected" Value="-1">Rejected</asp:ListItem>
                                        <asp:ListItem Text="Shortlisted" Value="1">Shortlisted</asp:ListItem>
                                        <asp:ListItem Text="Opening Closed" Value="3">Opening Closed</asp:ListItem>
                                        <asp:ListItem Text="Under Review" Value="2">Under Review</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <asp:CheckBox ID="chkcity1" runat="server" Text="Search in City" />
                                    <asp:DropDownList ID="ddlocation1" runat="server" CssClass="form-control" />
                                    <asp:TextBox ID="txtCity1" Width="150px" class="form-control" runat="server" placeholder="Search By City"></asp:TextBox>
                                    <input id="handleAutofillProb12" type="text" style="visibility: visible; width: 0px; height: 0px;" value="" />
                                </div>
                            </li>
                            <li>
                                <input name="btnSearch" type="submit" class="btn btn-default" id="btnSearch" value="Search"
                                    runat="server" onserverclick="btnSearch_ServerClick" causesvalidation="false" />
                            </li>
                        </ul>--%>
    <%--<div class="box">--%>
    <Elite:Message ID="ucMessage" runat="server" Visible="false" />
    <%--</div>--%>
    <%--<div class="message-box" id="message-box-surprise">
        <p class="text-h2 usrPrfTTL">
            * Please add the comments first and then change the candidate status from the drop down to ensure that the same gets updated.
        </p>
    </div>--%>
    <br />
    <div class="box">
        <Elite:ListView ID="ucListView" runat="server" />
    </div>
    <%--</div>--%>
    <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
    <asp:UpdateProgress ID="UpdateProgress3" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>
            <div style="background-color: White; filter: alpha(opacity=80); opacity: 0.8; height: 100%; width: 100%; position: absolute; top: -3%; left: 0; float: none; display: inline-block;">
                <span id="emailspinner1" class="fa fa-spinner fa-spin" style="position: relative; top: 48%; left: 48%; display: inline-block; padding: 2px; font-size: 36px;"></span>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <%--</div>
    </div>--%>
    <div class="subscr-bg">
        <Elite:NewsLetter ID="ucNewsLetter" runat="server" />
    </div>
    <input type="hidden" id="hdnJobApplicationID" value="" runat="server" />
    <input type="hidden" id="hdnobjId" value="" runat="server" />
    <div id="Background" class="Background">
    </div>
    <div id="Progress" class="Progress">
        <div class="closebutton">
            <a href="javascript://" class="btn btn-default" id="btnClose">Close</a>
        </div>
        <div id="tblMail" class="content-current">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group">
                    <label for="jobttile" class="label-txt-blue">
                        Subject</label>
                    <asp:TextBox ID="txtMailSubject" runat="server" class="form-control" placeholder="Mail Subject..."></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="jobttile" class="label-txt-blue">
                        Mail Body</label>
                    <asp:TextBox ID="txtMailBody" runat="server" class="form-control" placeholder="Mail Body..."
                        TextMode="MultiLine" Rows="8"></asp:TextBox>
                </div>
                <br clear="both" />
                <br />
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <a href="javascript://" class="btn-frm post-btn" style="line-height: 25px"
                        id="btnSend">Send Mail</a> &nbsp;&nbsp;
                </div>
            </div>
        </div>
    </div>
    <div id="divBackGroundViewApplicant" class="Background">
    </div>
    <div id="divContainerViewApplicant" class="Progress">
        <div class="row">
            <div class="closebutton">
                <a href="javascript://" class="btn btn-default" onclick="closeoverlay();">Close</a>
            </div>
            <div class="printbutton">
                <a href="javascript://" class="btn btn-primary" onclick="printSelection(document.getElementById('frmPrintJS'),'');">Print</a>
            </div>
        </div>
        <div id="printarea" style="height: 540px; overflow: auto">
            <iframe style="border: none; height: 480px" id="frmPrintJS" onload="resizeIframe(this);"></iframe>
        </div>
    </div>

    <script type="text/javascript">
        function SaveData(txtID, JobApplicationID) {
            PageMethods.SaveComments(JobApplicationID, document.getElementById(txtID).value, onSucess, onError);
            function onSucess(result) {
            }
            function onError(result) {
            }
        }
    </script>
    <%--<script src="/admin/js/daterangepicker.js" type="text/javascript"></script>--%>
    <%--<link rel="stylesheet" type="text/css" href="css/daterangepicker.css" />--%>
    <script type="text/javascript">
        $('#<%=txtActiveIn.ClientID %>').daterangepicker();
        //Date range as a button
        $('#daterange-btn').daterangepicker(

            {

                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                    'Last 7 Days': [moment().subtract('days', 6), moment()],
                    'Last 30 Days': [moment().subtract('days', 29), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                },
                startDate: moment().subtract('days', 29),
                endDate: moment()
            },
            function (start, end) {
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
            }
        );
        $('#<%=Txtregbetw.ClientID %>').daterangepicker();
        //Date range as a button
        $('#daterange-btn').daterangepicker(

            {

                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                    'Last 7 Days': [moment().subtract('days', 6), moment()],
                    'Last 30 Days': [moment().subtract('days', 29), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                },
                startDate: moment().subtract('days', 29),
                endDate: moment()
            },
            function (start, end) {
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
            }
        );
    </script>
</asp:Content>
