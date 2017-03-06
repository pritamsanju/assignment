<%@ Page Title="" Language="C#" MasterPageFile="~/writers/writers.Master" AutoEventWireup="true" CodeBehind="update-news.aspx.cs" Inherits="spotnews.writers.update_news" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3><b>Update Your News..</b></h3>
<br />
<b>Select news :</b>
    <asp:DropDownList ID="DropDownList1" runat="server" >
    </asp:DropDownList><br /><br />
    <asp:Button ID="Button1" runat="server" Text="check" CssClass="btn btn-primary" OnClick="Button1_Click"  />

    <br />
    <br />

    <asp:Label ID="selectionAlert" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <asp:Panel ID="updateNewsPanel" runat="server" Visible="false">

         <div class="form-group">
            <asp:TextBox ID="tbtitle" CssClass="form-control" runat="server" Width="401px"></asp:TextBox><br />
         </div><!--end of form group -->
       
        <div class="form-group">
            <asp:TextBox ID="tbdescription" CssClass="form-control" runat="server" Width="687px"></asp:TextBox><br />
        </div><!--end of form group -->
        <br />
         <asp:Button ID="Button2" runat="server" Text="Update" CssClass="btn btn-success" OnClick="Button2_Click" />
         <asp:Button ID="Button3" runat="server" Text="Cancle" CssClass="btn btn-danger" OnClick="Button3_Click"/>
    </asp:Panel>    <!--end of panel -->
</asp:Content>
