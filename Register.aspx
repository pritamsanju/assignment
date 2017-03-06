<%@ Page Title="" Language="C#" MasterPageFile="~/frontEnd.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="spotnews.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .register-form
        {
            border:5px thin silver;
            padding:5px;
            margin:10px;
        }
        .register-form p
        {
            font-size:25px;
        }
    </style>
     <link href="animate.css" rel="stylesheet" />
     <script type="text/javascript" src="jquery-3.1.1.js">
     </script>
    <div class="container">
        <div class="register-form">
             <div class="col-xs-6 col-xs-offset-2">
                    <p class="text-center"><b>Register for Spotnews</b></p><br />
                    <div class="form-group">
                            <asp:TextBox ID="tbemail" CssClass="form-control" placeholder="Enter email" runat="server" Width="100%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" ControlToValidate="tbemail"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"  ErrorMessage="Invalid email" ForeColor="Red" ControlToValidate="tbemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                    </div><!--end of form group -->  
                     <div class="form-group">
                                <asp:TextBox ID="tbname" CssClass="form-control" placeholder="Enter name" runat="server" Width="100%"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" ControlToValidate="tbname"></asp:RequiredFieldValidator>
                        </div><!--end of form group -->  
                     <div class="form-group">
                                <asp:TextBox ID="tbpassword" CssClass="form-control" placeholder="Enter password" runat="server" Width="100%" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" ControlToValidate="tbpassword"></asp:RequiredFieldValidator>
                     </div><!--end of form group -->  
                      <div class="form-group">
                                <asp:TextBox ID="tbpasswordconfirm" CssClass="form-control" placeholder="Enter password again"  runat="server" Width="100%" TextMode="Password"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" ControlToValidate="tbpasswordconfirm"></asp:RequiredFieldValidator>
                     </div><!--end of form group -->    
                 <div>
                     <p class="text-center">
                         <asp:Button ID="Button1" runat="server" Text="Register" CssClass="btn btn-success" OnClick="Button1_Click" /></p>
                 </div>
                 <p><asp:Label ID="Label1" runat="server" Visible="false"></asp:Label></p>
            </div><!-- end of col-->
        </div><!--en of register-form  -->
    </div><!-- end of container-->
</asp:Content>
