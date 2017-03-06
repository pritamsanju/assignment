<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="writer-login.aspx.cs" Inherits="spotnews.writers.writers_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Writers login. </title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
	<!-- animation -->
    <link href="../animate.css" rel="stylesheet" />
	<!-- custom css -->
    <link href="../CustomCSS.css" rel="stylesheet" />
    <!-- jquery -->
    <script src="../jquery-3.1.1.js"></script>
    <!-- custom js -->
    <script src="../customJS.js"></script>
</head>
<body style="background-color:silver">
    <form id="form1" runat="server">
    <div class="container">
        
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-sm-offset-3">
                <h2>Hi! Welcome to SpotNews Writer's Login</h2>
            </div><!--end of div col -->
        </div>
        <!--end of div row -->
        <hr />
        <div class="row">
                <div class="col-xs-12 col-sm-6 col-sm-offset-3">
                   <div class="writer-sign-in">
                       
                        <div class="form-group">
                            <asp:TextBox ID="tbwriteremail" CssClass="form-control" runat="server" placeholder="Enter email"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter email" Display="Dynamic" ControlToValidate="tbwriteremail" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="invalid email" Display="Dynamic" ControlToValidate="tbwriteremail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div><!--end of form group -->
                       
                        <div class="form-group">
                            <asp:TextBox ID="tbwriterpassword" CssClass="form-control" runat="server" placeholder="Enter password" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="please enter password" ControlToValidate="tbwriterpassword" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div><!--end of form group -->

                        <div class="sign_in_option">
                           <a href="reset-password.aspx">forgot-password?</a>
                            <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btn_login_Click" />
                            <asp:Label ID="login_msg" runat="server" Text=""></asp:Label>
                        </div><!--end of sign_in_option -->
                   </div><!--end of div writer sign in -->
                </div><!--end of div col -->
            </div>
        <!--end of div row -->
        

    </div><!--end of div container -->
    </form>
</body>
</html>
