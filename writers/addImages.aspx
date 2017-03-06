<%@ Page Title="" Language="C#" MasterPageFile="~/writers/writers.Master" AutoEventWireup="true" CodeBehind="addImages.aspx.cs" Inherits="spotnews.writers.addImages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <b><h3>&nbsp;</h3>
     <h3>Upload Images</h3>
     </b>
     <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Label ID="lblnote" runat="server" Text="*(file must have extension as one of these: .png,.jpeg,.jpg)" ForeColor="Red"></asp:Label>
    <br /><br />
        <asp:Button ID="btnImageUpload" runat="server" Text="Add more Images" CssClass="btn btn-success" OnClick="btnImageUpload_Click" />
    <asp:Button ID="btnDone" runat="server" Text="Done" CssClass="btn btn-primary" Visible="false" OnClick="btnDone_Click"/>
</asp:Content>
