<%@ Page Title="" Language="C#" MasterPageFile="~/writers/writers.Master" AutoEventWireup="true" CodeBehind="add-new-news.aspx.cs" Inherits="spotnews.writers.add_new_news" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<span class="center-block h2">Add new News Today!</span>
<hr />

<b>Select Catagory:</b>
<asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem Text="Sports" Value="1">Sports</asp:ListItem>
    <asp:ListItem Text="Politics" Value="2">Politics</asp:ListItem>
    <asp:ListItem Text="Arts" Value="3">Arts</asp:ListItem>
    <asp:ListItem Text="Entertainment" Value="4">Entertainment</asp:ListItem>
    <asp:ListItem Text="Agriculture" Value="5">Agriculture</asp:ListItem>
    <asp:ListItem Text="Fianance" Value="6">Fianance</asp:ListItem>
    <asp:ListItem Text="Science & Technology" Value="7">Science & Technology</asp:ListItem>
</asp:DropDownList>
<hr />
    
        
            <div class="col-xs-12 col-sm-6">
        <div class="form-group">
            <asp:TextBox ID="tbnewstitle" runat="server" CssClass="form-control" placeholder="enter news title" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"  ForeColor="Red" ControlToValidate="tbnewstitle" ValidationGroup="valgroup1"></asp:RequiredFieldValidator>
        </div><!--end of form-control -->
    </div><!--end of col -->
    <div class="col-xs-12 col-sm-12">
         <div class="form-group">
            <asp:TextBox ID="tbnewsdescription" runat="server" CssClass="form-control" placeholder="enter news description" Width="100%" Rows="5"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tbnewsdescription" ValidationGroup="valgroup1"></asp:RequiredFieldValidator>
        </div><!--end of form-control -->
    </div><!--end of col -->
        
    <div class="col-xs-12">
        <asp:Button ID="btn" CssClass="btn btn-success" runat="server" Text="save & add Images !" OnClick="btn_Click" ValidationGroup="valgroup1" />
    </div><br />
</asp:Content>
