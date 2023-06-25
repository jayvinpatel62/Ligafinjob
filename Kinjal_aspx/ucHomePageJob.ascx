<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucHomePageJob.ascx.cs"
    Inherits="Praccum_New.UserControls.ucHomePageJob" %>

<!---------------------------- Job list tabs start ---------------------------->
<div class="spacer"></div>
<section class="job-list-wrapper">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
		//rutvi added
                <ul  class="nav nav-tabs nav-home-tab">
                    <%--<div>--%>
                    <li class="tab-item active" id="liAll" runat="server">
                        <a href="" id="lnkAll" onserverclick="btncategory_click" data-member="0" class="nav-link" enableviewstate="false" causesvalidation="false" data-member="0"
                            ><span>All</span></a>
                       
                    </li>
                    <asp:Repeater ID="rptCategory" runat="server" OnItemDataBound="rptcategory_databound"
                        OnItemCommand="rptcategory_itemcommand" DataMember="JobCategoryID">
                        <ItemTemplate>
                            <li  class="tab-item" runat="server" id="licategory">
                                <a href="" runat="server" id="lnkcategory" enableviewstate="false" causesvalidation="false" class="nav-link">
                                    <span>
                                        <%#DataBinder.Eval(Container.DataItem, "CategoryCode").ToString()%></span></a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>                   
                </ul>
		//end rutvi
            </div>
            <div class="hr-primary"></div>
            <div class="container">
                <!-- Tab panes -->
                <div class="tab-content nav-home-tab-content p-md-5 p-3">
                    <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                        <div class="job-list-grid">
                            <asp:Repeater ID="rptJob" runat="server" OnItemDataBound="rptjob_databound">
                                <HeaderTemplate>
                                    <% if (rptJob.Items.Count <= 0)
                                        { %>
                                    <h3>Sorry, No Job found for selected category.<br />
                                        Please visit after sometime.
                                    </h3>
                                    <%}
                                        else
                                        { %>
                                    <div class="text-center"> //rutvi added
                                        <a href="/Jobs/<%#CategoryURL.ToString()%>" class="link-primary uppr" target="_blank">Advanced search</a>
                                    </div>
                                    <br>
                                    <% } %>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="job-item">
                                        <a id="lnkJob" runat="server" href="" target="_blank" class="job-title"><%#Eval("Title") %></a>
                                        <div class="job-content">
                                            <div class="coupon-code">
                                                <div class="c_code"><%#Eval("JobCode") %></div>
                                                <div class="vr"></div>
                                                <a id="lnkApply" runat="server" target="_blank" href="" class="link">Apply</a>
                                            </div>
                                            <div class="post-date">
                                                <span class="postOn">Posted on</span>
                                                <div class="vr"></div>
                                                <span class="posdateby"><%#Eval("JobDateInWords").ToString()%></span> <%--by <%#Eval("CompanyName").ToString() %>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- <li>
                                        <h2>
                                            <a id="lnkJob1" runat="server" href="" target="_blank">
                                                <%#Eval("Title") %></a></h2>
                                        <div class="dw-cont">
                                            <div <%#Eval("JobStatusText").ToString()=="Close"?"class=\"col-md-4 bx-id clss-close\"" : "class=\"col-md-4 bx-id clss-open\""%> style="width: auto">

                                                <%#Eval("JobCode") %> <span>|
                                                             <a id="lnkApply1" runat="server" target="_blank" href="" style="font-size: 12px"><b>Apply</b></a></span>
                                            </div>
                                            <div class="col-md-8 post-date" style="padding-top: 7px">
                                                <span>Posted on</span><%#Eval("JobDateInWords").ToString()%> by <%#Eval("CompanyName").ToString() %>
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </li>--%>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <% if (rptJob.Items.Count > 0)
                                        { %>
                                    <br>
                                    <div class="text-center">//rutvi added
                                        <a href="/Jobs/<%#CategoryURL.ToString() %>" class="link-primary uppr" target="_blank">View all openings</a>
                                    </div>
                                    <% } %>
                                </FooterTemplate>
                            </asp:Repeater>
                            </div>
                            
                <%--</div>--%>
                </div>
             </div>
                <asp:UpdateProgress ID="UpdateProgress2" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
                    <ProgressTemplate>
                        <div style="background-color: White; filter: alpha(opacity=80); opacity: 0.8; height: 100%;
                            width: 100%; position: absolute; top: -3%; left: 0; float: none; display: inline-block;">
                            <span id="emailspinner1" class="fa fa-spinner fa-spin" style="position: relative;
                                top: 48%; left: 48%; display: inline-block; padding: 2px; font-size: 36px;">
                            </span>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</section>
<!---------------------------- Job list tabs  close ---------------------------->


