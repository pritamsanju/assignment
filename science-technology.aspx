<%@ Page Title="" Language="C#" MasterPageFile="~/frontEnd.Master" AutoEventWireup="true" CodeBehind="science-technology.aspx.cs" Inherits="spotnews.science_technology" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .newsContent
        {
            padding-top:20px;
            width:100%;
            height:auto;
            background-color:#d8d4d4;
        }
        
        .newsElement
        {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        }
            .newsElement p
            {
                background-color:#efe487;
            }
    </style>
     <link href="animate.css" rel="stylesheet" />
    <script type="text/javascript" src="jquery-3.1.1.js">
    </script>
    <div class="newsContent">
        <asp:Repeater ID="Repeater1" runat="server"> 
            <ItemTemplate>
                <div class="container">
                       <div class="col-lg-8 col-lg-offset-2">
                           <div class="newsElement">
                                 <a href="newsInfo.aspx?id='<%#Eval("newsID")%>'">
                                     <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("imageLocation") %>' CssClass="img-thumbnail" Height="200px" Width="100%" /></a>
                                <p class="text-center"><b><%#Eval("newsTitle") %></b></p>      
                           </div> 
                           
                       </div>
                </div>
                
            </ItemTemplate>
        </asp:Repeater>
    </div><!--end of news contents -->
</asp:Content>
