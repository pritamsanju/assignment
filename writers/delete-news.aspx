<%@ Page Title="" Language="C#" MasterPageFile="~/writers/writers.Master" AutoEventWireup="true" CodeBehind="delete-news.aspx.cs" Inherits="spotnews.writers.delete_news" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3><b>Delete Your News..</b></h3>
    <br />
<b>Select news :</b>
    <asp:DropDownList ID="DropDownList1" runat="server" >
    </asp:DropDownList><br /><br />
    <asp:Button ID="Button1" runat="server" Text="check" CssClass="btn btn-primary" OnClick="Button1_Click"  />

    <br />
    <br />

    <asp:Label ID="selectionAlert" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <asp:Panel ID="panelForDelete" runat="server" Visible="false">
            <b>Title :</b><asp:Label ID="lblTitle" runat="server"></asp:Label><br />
        <b>Description :</b><asp:Label ID="lblDescription" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btndelete_Click" />
    &nbsp;&nbsp;
    <asp:Button ID="btncamcle" runat="server" Text="Cancle" CssClass="btn btn-danger" OnClick="btncamcle_Click" />
    <br />
    <br />
    <br />
    
    </asp:Panel>   

</asp:Content>
