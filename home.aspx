<%@ Page Title="" Language="C#" MasterPageFile="~/frontEnd.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="spotnews.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    
     <style>
            #carousel_container, #carousel_container img {
                width:100%;
                height:350px;
                }
        .newsThumbs
        {
            padding:10px;
            height:700px;
            background-color:#e99d4a;
        }
        .divthumb img
        {
            width:100%;
            height:100%;
        }
        .divthumb p
        {
            text-align:center;
            font-size:20px;
        }
        .newsHeader p
        {
            text-align:center;
            font-family:Calibri;
            font-size:25px;
        }
         .newsCatalog
         {
             background-color:#ebe2e2;
             height:auto;
         }
         .divSubscribe
         {
             height:auto;
             min-width:100%;
         }
         .innerjumbo
         {
             padding:5px;
         }
         .elementCenter
         {
             margin-left:30%;
         }
         input[type=text]
         {
             width:40%;
         }
         .divthumb a p
         {
             color:black;
         }
            
    </style>
    <link href="animate.css" rel="stylesheet" />
    <script type="text/javascript" src="jquery-3.1.1.js">
    </script>
    <script type="text/javascript">
        $(document).ready(function () {

            $('.newsThumbs img').mouseover(function () {
                $(this).addClass('animated slideInUp');
            }).mouseout(function () {
                $(this).remove('animated slideInUp');
                })
            });
    </script>
    
    
        <div class="carouselContainer">
                    <div id="carousel_container">
				    <div id="imageCarousel" class="carousel slide" data-interval="2500" data-ride="carousel">
				            <ol class="carousel-indicators">
					            <li data-target="#imageCarousel" data-slide-to="0" class="active"></li>
					            <li data-target="#imageCarousel" data-slide-to="1"></li>
					            <li data-target="#imageCarousel" data-slide-to="2" ></li>
					            <li data-target="#imageCarousel" data-slide-to="3" ></li>
					            
				            </ol>
				    	    <div class="carousel-inner">
  						        <div class="item active">
							        <a href="agriculture.aspx">
							        <img src="homepageImages/agricarousel.jpg" />
							        <div class="carousel-caption">
                                        <p>AGRICULTURE</p>
							        </div>
							        </a>
						        </div><!-- end of class div item -->
                                <div class="item">
							        <a href="entertainment.aspx">
							        <img src="homepageImages/entercarousel.jpg"/>
							        <div class="carousel-caption">
                                        <p>ENTERTAINMENT</p>
							        </div>
							        </a>
						        </div><!-- end of class div item -->
	    					    <div class="item">
							        <a href="fianance.aspx">
							        <img src="homepageImages/fianancecarousel.jpg"/>
							        <div class="carousel-caption">
                                        <p>FIANANCE</p>
							        </div>
							        </a>
						        </div><!-- end of class div item -->
	    					    <div class="item">
							        <a href="science-technology.aspx">
							        <img src="homepageImages/scicarousel.jpg" class="img-responsive"/>
							        <div class="carousel-caption">
								        <p>SCIENCE & TECHNOLOGY</p>
							        </div>
							        </a>
						        </div><!-- end of class div item -->
					        </div>  <!-- end of carousel inner-->
				    </div><!--end of imageCarousel div -->			
			    </div><!-- end of corosel_container div -->
                </div>
	        <!--end of carousel -->
          
        <div class="newsThumbs">
            
            <div class="newsHeader">
                      <p><b>choose news in your way..</b></p><hr />
                  </div><!--end of newsHeader -->
            <div class="newsCatalog">
                 <div class="col-xs-4">
                     <div class="divthumb">
                         <a href="sports.aspx">
                             <asp:Image ID="Image1" runat="server" ImageUrl="~/homepageImages/sportsfront.jpg" CssClass="img-thumbnail" /><br />
                             <p><b>Sports</b></p>
                         </a>
                     </div><!--end of divthumb -->
                 </div><!-- end of col-->
                 <div class="col-xs-4">
                     <div class="divthumb">
                         <a href="politics.aspx">
                             <asp:Image ID="Image2" runat="server" ImageUrl="~/homepageImages/politicsfront.jpg"  CssClass="img-thumbnail" /><br />
                             <p><b>Politics</b></p>
                         </a>
                     </div><!--end of divthumb -->
                 </div><!-- end of col-->
                 <div class="col-xs-4">
                     <div class="divthumb">
                         <a href="entertainment.aspx">
                             <asp:Image ID="Image3" runat="server" ImageUrl="~/homepageImages/entertainmentfront.jpg" CssClass="img-thumbnail"  /><br />
                             <p><b>Entertainment</b></p>
                         </a>
                     </div><!--end of divthumb -->
                 </div><!-- end of col-->
                 <div class="col-xs-4">
                     <div class="divthumb">
                         <a href="fianance.aspx">
                             <asp:Image ID="Image4" runat="server" ImageUrl="~/homepageImages/financefront.jpg" CssClass="img-thumbnail"  /><br />
                             <p><b>Finance</b></p>
                         </a>
                     </div><!--end of divthumb -->
                 </div><!-- end of col-->
                 <div class="col-xs-4">
                     <div class="divthumb">
                         <a href="agriculture.aspx">
                             <asp:Image ID="Image5" runat="server" ImageUrl="~/homepageImages/agrifront.jpg" CssClass="img-thumbnail"  /><br />
                             <p><b>Agriculture</b></p>
                         </a>
                     </div><!--end of divthumb -->
                 </div><!-- end of col-->
                 <div class="col-xs-4">
                     <div class="divthumb">
                         <a href="arts.aspx">
                             <asp:Image ID="Image6" runat="server" ImageUrl="~/homepageImages/artsfront.png" CssClass="img-thumbnail" /><br />
                             <p><b>Arts</b></p>
                         </a>
                     </div><!--end of divthumb -->
                 </div><!-- end of col-->
            
            </div><!--end of newsCatalog -->
                
          </div>
            <!--end of newsThumb -->
        
        <div class="divSubscribe">
        <div class="jumbotron">
            <div class="innerjumbo">
                <h1 class="text-center">Subscribe Now!</h1>
                <p class="text-center">Subscribe now to get the latest news from all over the world in no time...</p>
                <p class="elementCenter">
                    <asp:TextBox ID="tbEmailSubscribe" runat="server" placeholder="enter email" CssClass="form-control" ValidationGroup="subEmail"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="email is required" ForeColor="Red"  ValidationGroup="subEmail" ControlToValidate="tbEmailSubscribe" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="invalid email"  ForeColor="Red" ValidationGroup="subEmail" ControlToValidate="tbEmailSubscribe" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                    <asp:Label ID="lblSubsription" runat="server" Visible="false"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Subscribe"  CssClass="btn btn-primary" ValidationGroup="subEmail" OnClick="Button1_Click" />
                </p>         
            </div><!--end of innerjumbo -->
        </div><!--end of jumbotron -->
    </div>
            <!-- end of divSubscribe-->
      
      
</asp:Content>
