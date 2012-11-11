<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageUserSubscriptionTypes.aspx.cs" Inherits="Admin_ManageUserSubscriptionTypes" %>
<asp:Content ID="StyleContent" ContentPlaceHolderID="HC" Runat="Server">
<style type="text/css">
    #uscontainer {  margin:20px 0px; font-family:Verdana, Georgia, Helvetica, Arial;}   
    #uscontainer h1 { font-size:26px;text-align:center; margin:10px 0px; font-weight:bold; }
    #uscontainer .row { margin-bottom:10px; }
    #uscontainer .lbl { color:#444; font-weight:bold; float:left; text-align:right; width:175px; margin-right:15px; line-height:30px;}
    #uscontainer .value { float:left; }
    #uscontainer .txt { font-size:14px; font-weight:bold; padding:4px 2px; width:180px;}    
    #uscontainer .dt { padding:4px 2px; font-size:12px;}
    #uscontainer .dt1 { padding:5px 2px; font-size:14px; }
    #uscontainer .ex { margin-top:5px; font-size:10px; color:#bbb; }
</style>
<script type="text/javascript">
    function clearMessageBox() {
        $('#messageBox').empty();
    }

    function confirmDelete() {
        var $lstSubscriptionTypes = $("select[id$=lstSubscriptionTypes]");
        if ($lstSubscriptionTypes.length > 0) {
            var value = $lstSubscriptionTypes.val();
            if (value != "0") {
                return confirm("Are you sure you want to delete this subscription type");
            }
        }
        return true;
    }
</script>
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MC" Runat="Server">
    <div id="uscontainer" style="width:600px;margin:0px auto;">
        <div class="box">
            <h1>Manage User Subscription Types</h1>
            <asp:ValidationSummary ID="vldSummary" runat="server" ShowMessageBox="false" ShowSummary="true" />
            <div class="messageBox">
                <asp:Literal ID="litCurrentMessage" runat="server" EnableViewState="false" />
            </div>
            <asp:Panel ID="pnlSubscriptionTypes" runat="server">
                <asp:DropDownList ID="lstSubscriptionTypes" runat="server" AppendDataBoundItems="true" CssClass="dt1" DataTextField="Text" DataValueField="Value">
                    <asp:ListItem Text="-- please select --" Value="0" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="reqSubscriptionType" runat="server" ControlToValidate="lstSubscriptionTypes" InitialValue="0" Text="*" ErrorMessage="Please select subscription type you want to delete" />
                <asp:Button ID="btnDelete" runat="server" CssClass="btn" Text="Delete" 
                    onclick="btnDelete_Click" OnClientClick="clearMessageBox(); return confirmDelete();"/>
                <hr />
                <asp:Button ID="btnAdd" runat="server" Text="Add New Subscription Type" 
                    CssClass="btn" CausesValidation="false" onclick="btnAdd_Click" />
            </asp:Panel>
            <asp:Panel ID="pnlAddNewSubscriptionType" runat="server" Visible="false">
                <div style="margin:10px 0px;padding:10px; border-top:1px dashed #bbb;">
                    <h2>Add new user subscription type</h2>
                    <div class="row clearfix">
                        <div class="lbl">* Amount:</div>
                        <div class="value">
                            <asp:TextBox ID="txtAmount" runat="server"  CssClass="txt" style="width:60px;" MaxLength="8" />
                            <asp:RequiredFieldValidator ID="reqAmount" runat="server" ControlToValidate="txtAmount" Text="*" ErrorMessage="Please enter amount." />
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="lbl">* Duration Type:</div>
                        <div class="value">
                            <asp:DropDownList ID="lstDurationType" runat="server" CssClass="dt" />
                            <asp:RequiredFieldValidator ID="reqDurationType" runat="server" ControlToValidate="lstDurationType" Text="*" ErrorMessage="Please select duration type." InitialValue="-1" />
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="lbl">* Duration Time:</div>
                        <div class="value">
                            <asp:TextBox ID="txtDurationTime" runat="server"  CssClass="txt" style="width:40px;" MaxLength="4" />
                            <asp:RequiredFieldValidator ID="reqDurationTime" runat="server" ControlToValidate="txtDurationTime" Text="*" ErrorMessage="Please enter duration time." />
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="lbl">* Subscription Cycles:</div>
                        <div class="value">
                            <asp:TextBox ID="txtTotalCycles" runat="server"  CssClass="txt" style="width:40px;" MaxLength="4" />
                            <asp:RequiredFieldValidator ID="reqTotalCycles" runat="server" ControlToValidate="txtTotalCycles" Text="*" ErrorMessage="Please total number of subscription cycles." />                                                        
                            <div class="ex">* Enter 0 for no recurring subscription</div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="lbl">* Name:</div>
                        <div class="value">
                            <asp:TextBox ID="txtName" runat="server"  CssClass="txt" style="width:250px;"/>
                            <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtName" Text="*" ErrorMessage="Please enter name."  />
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="lbl">* Description:</div>
                        <div class="value">
                            <asp:TextBox ID="txtDescription" runat="server"  CssClass="txt" TextMode="MultiLine" style="width:250px;height:80px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescription" Text="*" ErrorMessage="Please enter description." OnClientClick="clearMessageBox();"/>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="lbl">&nbsp;</div>
                        <div class="value">
                            <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" CssClass="btn" />&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" CssClass="btn" style="font-weight:normal;" />
                        </div>
                    </div>                    
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

