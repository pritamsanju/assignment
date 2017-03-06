<%@ Page Title="" Language="C#" MasterPageFile="~/frontEnd.Master" AutoEventWireup="true" CodeBehind="newsInfo.aspx.cs" Inherits="spotnews.newsInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .requestedNews
        {
            padding:5px;
        }
        .requestedNews_title
        {
            padding:15px;
            font-size:larger;
            font-family:'Times New Roman';
        }
        .requestedNews_image
        {
            margin:5px;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        }
        .requestedNews_description
        {
            padding:10px;
            font-size:medium;
            font-family:'Times New Roman';
        }
        .bigfont
        {
            font-size:40px;
        }
        .smallfont
        {
            font-size:15px;
            font-style:italic;
            color:silver;
        }
        .userComment
        {
            padding:5px;
        }
        tbody #name
        {
                   font-size:25px;
                   color:green;        
        }
        .addComment
        {
            padding-top:15px;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            background-color:#e4dede;
        }
    </style>
    <link href="animate.css" rel="stylesheet" />
    <script type="text/javascript" src="jquery-3.1.1.js">
    </script>
     <script type="text/javascript">

         $(document).ready(function () {
             var currentPageNumber = 1;
             loadComment(currentPageNumber);

             $(window).scroll(function () {

                 if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                     currentPageNumber += 1;
                     loadComment(currentPageNumber);
                 }
             });


             function loadComment(currentPage) {
                 $.ajax({
                     url: 'spotnewsComments.asmx/UserCommnets',
                     method: 'post',
                     data: { pageNumber: currentPage, pageSize: 5 },
                     dataType: 'json',
                     success: function (data) {
                         var tblComment = $("#tbcomment tbody");

                         $(data).each(function (index, comm) {
                             tblComment.append('<tr><td id="name"><b>' + comm.name + '</b></td></tr><tr><td><b>' + comm.userComments + '</b></td></tr>');
                         })
                     }
                 });
             }
         });
    </script>
    
    <!--requested News -->
    <div class="requestedNews">
        <asp:Panel ID="Panel1" runat="server">

            <div class="requestedNews_title">
                <asp:Label ID="Label1" runat="server" CssClass="bigfont"></asp:Label><br />
                <asp:Label ID="Label3" runat="server" CssClass="smallfont"></asp:Label>
            </div><!--end of requestedNews_title -->

            <div class="requestedNews_image">
                <asp:Image ID="Image1" runat="server" Width="100%" Height="300px" />
            </div><!--end of requestedNews_image-->

            <div class="requestedNews_description">
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </div><!--end of requestedNews_description -->    

            <div class="addComment">
                <asp:Panel ID="userAddingComment" runat="server">
                    <div class="container">
                        <div class="col-xs-6">
                        <div class="form-group">
                            <asp:TextBox ID="tbaddcomments" CssClass="form-control" placeholder="Enter your comments" runat="server" Width="100%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" ControlToValidate="tbaddcomments"></asp:RequiredFieldValidator>
                            <asp:Label ID="Label4" runat="server" Visible="false"></asp:Label>
                         </div><!--end of form group -->
                    </div><!--end of col -->
                    <div class="col-xs-6">
                         <asp:Button ID="Button1" runat="server" Text="submit" CssClass="btn btn-success" OnClick="Button1_Click" />
                    </div>
                    </div>
                </asp:Panel>    
            </div><!--end of addComment -->
              <br />
            <div class="userComment">
                <h3><b>Comments:</b></h3>
                    <table id="tbcomment">
                        <tbody></tbody>
                    </table>
            </div>
            <!-- end of userComment-->
            
        </asp:Panel>
    </div>
    <!--end of requestedNews -->
    
</asp:Content>
