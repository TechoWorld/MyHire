﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
         <script type="text/javascript">

         
             function TodayFollowUp() {
                 openNewWindow('<%="TodayFollowUp.aspx?UserId="+(Session["UserId"].ToString()) + " &URole= " + (Session["UserRole"].ToString()) %>');
             } 
             function TodayPosition() {
                 openNewWindow('<%="TodayPosition.aspx?UserId="+(Session["UserId"].ToString()) + " &URole= " + (Session["UserRole"].ToString()) %>');
             }
             function TodayStatus() {
                 openNewWindow('<%="TodayStatus.aspx?UserId="+(Session["UserId"].ToString()) + " &URole= " + (Session["UserRole"].ToString()) %>');
             }
             function MTD() {
                   openNewWindow('<%="MTD.aspx?UserId="+(Session["UserId"].ToString()) + " &URole= " + (Session["UserRole"].ToString()) %>');
             }
             function TodayInterviewScheduled() {
                 openNewWindow('<%="TodayInterviewScheduled.aspx?UserId="+(Session["UserId"].ToString()) + " &URole= " + (Session["UserRole"].ToString()) %>');
               }
             
             function openNewWindow(url) {
                 
                 window.open(url, "_blank", "toolbar=no,   width=1100, height=500,scrollbars=yes, resizable=no");
             }

    </script>
    <style type="text/css">
        .pnltop
        {
            width: 100%;
            height: auto;
        }
        
        /*CSS for Grid View*/
        .mGridDash
        {
            width: 100%;
            background-color: #CA1A21;
            margin: 5px 0 10px 0;
            border: 1px solid #FECBD3;
            border-collapse: collapse;
        }
        .mGridDash th
        {
            background: url('../Image/redmenu.jpg') repeat-x left center;
            color: #FFFFFF;
            font-family: Lucida Sans Unicode;
            font-size: 13px;
            height: 20px;
            vertical-align: middle;
            word-spacing: 5px;
            background-color: #CA1A21;
        }
        .mGridDash td
        {
            border: 1px solid #FECBD3;
            color: #232323;
            font-family: "Lucida Sans Unicode";
            text-align: left;
            padding-left: 10px;
            font-size: 11px;
            vertical-align: middle;
        }
        
        .mGridDash .alt
        {
            background: #F9FCFF top;
        }
        
        .mGrid tbody tr:hover, .GridView tbody tr:hover td, .GridView tbody tr.hover, .GridView tbody tr.hover td
        {
            background: #F5FAFC;
            color: #000000;
        }
        .lbtnFView
        {
            font-family: "Lucida Sans Unicode";
            font-size: 14px;
            color: #0D203F;
            font-weight: 300;
        }
        .lbtnFolloup
        {
            font-family: "Lucida Sans Unicode";
            font-size: 14px;
            color: #008080;
        }
        .style3
        {
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="page" style="height:900px;margin-top: 26px;">
        <center>
            <table width="100%" >
                <tr>
                    <td align="left" valign="top" colspan="2">
                        <h2>
                            Today's Follow Up&nbsp;  
                            <asp:Button runat="server" ID="btnFollowUp" Visible="False" Text="Today’s Follow Up" CssClass="btnCancel"  OnClientClick="TodayFollowUp()" Width="150px" /> </h2>
                        <asp:Panel ID="pnlFollowUp" runat="server" CssClass="pnltop" ScrollBars="Auto">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gdvFolloup" runat="server" AutoGenerateColumns="False" AllowPaging="True"  
                                        OnPageIndexChanging="gdvFolloup_PageIndexChanging" GridLines="Vertical" 
                                        EmptyDataText="No Follow Up is scheduled for today." 
                                        OnRowCommand="gdvFolloup_RowCommand" PageSize="5"  HeaderStyle-ForeColor="White" onsorting="gdvFolloup_Sorting" AllowSorting="true" CssClass="mGridDash" CurrentSortDirection="Desc" CurrentSortField="Client_Name">
                                        <AlternatingRowStyle CssClass="alt" />
                                        <FooterStyle CssClass="footer" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("Candidate_Id")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RRID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRRId" runat="server" Text='<%#Eval("RRCandidate_Id")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Client Name" SortExpression="Client_Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblClntName" runat="server" Text='<%#Eval("Client_Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--  <asp:TemplateField HeaderText="HR" SortExpression="USR_Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUSR_Name" runat="server" Text='<%#Eval("USR_Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="RR-No" SortExpression="RRNumber">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRRNo" runat="server" Text='<%#Eval("RRNumber")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Role" SortExpression="Job_Profile">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRole" runat="server" Text='<%#Eval("Job_Profile")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                            <asp:TemplateField HeaderText="Name" SortExpression="Candidate_Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("Candidate_Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                          <%--  <asp:TemplateField HeaderText="Mobile No." SortExpression="Mobile_No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMobile" runat="server" Text='<%#Eval("Mobile_No")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
<%--                                            <asp:TemplateField HeaderText="CTC" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCTC" runat="server" Text='<%#Eval("Annual_Salary")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Candidate Status"  SortExpression="Overall_Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRecStatus" runat="server" Text='<%#Eval("Overall_Status")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                        <%--                    <asp:TemplateField HeaderText="Supervisor_Status " Visible="false" >
                                            <ItemTemplate>
                                                <asp:Label ID="lblApproveStatus" runat="server" Text='<%#Eval("Supervisor_Status")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Candidate Status" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCandStatus" runat="server" Text='<%#Eval("Candidate_Status")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="FollowUp_Date" SortExpression="FollowUp_Date" >
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFollowUp_Date" runat="server" Text='<%#Eval("FollowUp_Date")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="ViewButton" CommandName="View" runat="server" Text="View" CssClass="lbtnFView" Visible="false" />
                                                    &nbsp;
                                             <asp:ImageButton ID="FollowUp" CommandName="FollowUp" runat="server" ImageUrl="~/Image/Followup.png" ToolTip="FollowUp"
                                                    Height="22px" Width="28px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                

                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gdvFolloup" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:Panel>
                    </td>
                    <td></td>
                    <td valign="top" align="left">
                    <h2>My Today’s Position&nbsp;   <asp:Button runat="server" ID="btnTodayPosition" Visible="False" Text="Today’s Position " CssClass="btnCancel" OnClientClick="TodayPosition()" Width="150px" /></h2>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                    <asp:GridView ID="gdvTodayPosition" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                        OnPageIndexChanging="gdvTodayPosition_PageIndexChanging" 
                            GridLines="Vertical" 
                                        EmptyDataText="No Position Today" 
                            OnRowCommand="gdvTodayPosition_RowCommand" PageSize="5" 
                            onrowdatabound="gdvTodayPosition_RowDataBound" HeaderStyle-ForeColor="White" onsorting="gdvTodayPosition_Sorting" AllowSorting="true" CssClass="mGrid" CurrentSortDirection="Desc" CurrentSortField="Client_Id">
                                        <AlternatingRowStyle CssClass="alt" />
                                        <FooterStyle CssClass="footer" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("Client_Id")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                      <%--      <asp:TemplateField HeaderText="RRID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRRId" runat="server" Text='<%#Eval("RRCandidate_Id")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                             <asp:TemplateField HeaderText="Client Name" SortExpression="Client_Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblClient_Name" runat="server" Text='<%#Eval("Client_Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                       
                                               <asp:TemplateField HeaderText="HR Name" SortExpression="Person_Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPerson_Name" runat="server" Text='<%#Eval("Person_Name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                             <asp:TemplateField HeaderText="RR-No" SortExpression="RRNumber">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRRNo" runat="server" Text='<%#Eval("RRNumber")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                               

                                           <asp:TemplateField HeaderText="Role" SortExpression="Job_Profile">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJob_Profile" runat="server" Text='<%#Eval("Job_Profile")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Location" SortExpression="City_Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("City_Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        
                                       <%--     <asp:TemplateField HeaderText="CTC" Visible="false" SortExpression="Annual_Salary">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCTC" runat="server" Text='<%#Eval("Annual_Salary")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Recruiter Status" Visible="false" SortExpression="Recruiter_Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRecStatus" runat="server" Text='<%#Eval("Recruiter_Status")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Supervisor_Status " SortExpression="Supervisor_Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApproveStatus" runat="server" Text='<%#Eval("Supervisor_Status")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Candidate Status" Visible="false" SortExpression="Candidate_Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCandStatus" runat="server" Text='<%#Eval("Candidate_Status")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                             
                                            <asp:TemplateField HeaderText="Action" Visible="false">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="ViewButton" CommandName="View" runat="server" Text="View" CssClass="lbtnFView" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    </ContentTemplate>
                                   
                        </asp:UpdatePanel>
                        <asp:Label ID="lblSentPending" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr >
                    <td align="left" valign="top" >
                       <asp:Panel ID="Admin" runat="server" CssClass="pnltop" ScrollBars="Auto">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                 <h2>
                                     My Today&#39;s Status&nbsp; <asp:Button ID="btnTodayStatus" runat="server" CssClass="btnCancel" OnClientClick=" TodayStatus()" Text="Today's Status" Visible="false" Width="120px" />
                                    </h2>
                                    <asp:GridView ID="gdvPending" runat="server" AutoGenerateColumns="true" 
                            CssClass="mGrid" onrowcreated="gdvPending_RowCreated"    OnPageIndexChanging="gdvPending_PageIndexChanging" AllowPaging="True" PageSize="5"
                                            EmptyDataText="No Today Status" 
                            onrowdatabound="gdvPending_RowDataBound" >
                            <%--  OnPreRender="gdv_PreRender"--%>
                        </asp:GridView>
                     
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gdvPending" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:Panel>
                        
                    </td>

                    <td align="left" valign="top" >
                       
                        
                        <asp:Panel ID="Admin0" runat="server" CssClass="pnltop" ScrollBars="Auto">
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <h2>&nbsp;MY MTD&nbsp;  <asp:Button ID="btnMTD" runat="server" CssClass="btnCancel" OnClientClick="MTD()" Text="MTD" Visible="false" Width="80px" />
                                    </h2>
                                    <asp:GridView ID="gdvPendingMDT" runat="server" AllowPaging="True"    EmptyDataText="No Monthly Status"  AutoGenerateColumns="true" 
                                        CssClass="mGrid" OnPageIndexChanging="gdvPendingMDT_PageIndexChanging"
                                         onrowcreated="gdvPendingMDT_RowCreated" onrowdatabound="gdvPendingMDT_RowDataBound" PageSize="5" >
                            <%--  OnPreRender="gdv_PreRender"--%>
                                    </asp:GridView>
                   
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gdvPendingMDT" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:Panel>
                       
                        
                    </td>

                    <td width="15px">
                    </td>
                    <td>
                     <h2>
                            My Interview Scheduled  <asp:Button ID="btnTodayInterviewScheduled" runat="server" CssClass="btnCancel" OnClientClick="TodayInterviewScheduled()" Text="Today Interview Scheduled " Visible="false" Width="200px" />
                        </h2>
                        <asp:Panel ID="pnlInterviewSchedule" runat="server" CssClass="pnltop" ScrollBars="Auto">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gdvInterview" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                        OnPageIndexChanging="gdvInterview_PageIndexChanging" GridLines="Vertical" CssClass="mGridDash"
                                        EmptyDataText="No interview is scheduled for today." 
                                        OnRowCommand="gdvInterview_RowCommand" PageSize="5" HeaderStyle-ForeColor="White" onsorting="gdvInterview_Sorting" AllowSorting="true"  CurrentSortDirection="Desc" CurrentSortField="RRNumber">
                                        <AlternatingRowStyle CssClass="alt" />
                                        <FooterStyle CssClass="footer" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("Candidate_Id")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RRID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRRId" runat="server" Text='<%#Eval("RRCandidate_Id")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Client Name" SortExpression="Client_Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblClntName" runat="server" Text='<%#Eval("Client_Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <%-- <asp:TemplateField HeaderText="Consultant" SortExpression="USR_Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUSR_Name" runat="server" Text='<%#Eval("USR_Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                               
                                              <asp:TemplateField HeaderText="HR Name" SortExpression="Person_Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPerson_Name" runat="server" Text='<%#Eval("Person_Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="RR-No" SortExpression="RRNumber">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRRNo" runat="server" Text='<%#Eval("RRNumber")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Role" SortExpression="Job_Profile">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJob_Profile" runat="server" Text='<%#Eval("Job_Profile")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name" SortExpression="Candidate_Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("Candidate_Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mobile No." SortExpression="Mobile_No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMobile" runat="server" Text='<%#Eval("Mobile_No")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                   
                                            <asp:TemplateField HeaderText="Candidate Status" SortExpression="Candidate_Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCandStatus" runat="server" Text='<%#Eval("Candidate_Status")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                       
                                            <asp:TemplateField HeaderText="Action"  Visible="false" >
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="ViewButton" CommandName="View" runat="server" Text="View" CssClass="lbtnFView" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gdvInterview" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" colspan="2">
                        <h2>
                            Today Refer Status </h2>
                        <asp:Panel ID="pnlReffered" runat="server" CssClass="pnltop" ScrollBars="Auto">
                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gdvReffered" runat="server" AutoGenerateColumns="False" AllowPaging="True"  
                                        OnPageIndexChanging="gdvReffered_PageIndexChanging" GridLines="Vertical" 
                                        EmptyDataText="No Follow Up is scheduled for today." 
                                        OnRowCommand="gdvReffered_RowCommand" PageSize="5"  HeaderStyle-ForeColor="White" onsorting="gdvReffered_Sorting" AllowSorting="true" CssClass="mGridDash" CurrentSortDirection="Desc" CurrentSortField="Client_Name">
                                        <AlternatingRowStyle CssClass="alt" />
                                        <FooterStyle CssClass="footer" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("Candidate_Id")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RRID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRRId" runat="server" Text='<%#Eval("RRCandidate_Id")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Client Name" SortExpression="Client_Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblClntName" runat="server" Text='<%#Eval("Client_Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        
                                            <asp:TemplateField HeaderText="RR-No" SortExpression="RRNumber">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRRNo" runat="server" Text='<%#Eval("RRNumber")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Name" SortExpression="Candidate_Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("Candidate_Name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Role" SortExpression="Job_Profile">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRole" runat="server" Text='<%#Eval("Job_Profile")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                            <asp:TemplateField HeaderText="Reffered"  SortExpression="Refered">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRefered" runat="server" Text='<%#Eval("Refered")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                       
                                        </Columns>
                                    </asp:GridView>
                                

                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gdvReffered" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:Panel>
                    </td>
                </tr>
               <%-- <tr>
                <td colspan="4" align="left" style="font-weight: 700">Total RR Assigend :&nbsp;
                <asp:Label ID="lblTtlRR" runat="server" ></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Total Identified Candidate(<span class="style3">Today</span>) :&nbsp;
                <asp:Label ID="lblTdayIdentfied" runat="server" ></asp:Label>
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Today's Task :
                &nbsp; <asp:Label ID="lblTodayFollowUp" runat="server" ></asp:Label></td>
                </tr>--%>
            </table>
        </center>
    </div>
</asp:Content>
