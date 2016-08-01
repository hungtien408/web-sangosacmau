<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,300,400italic,500,500italic,700,700italic&subset=latin,vietnamese'
        rel='stylesheet' type='text/css' />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/ico" href="favicon.ico" />
    <link href="assets/styles/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/styles/uniform-base.css" rel="stylesheet" type="text/css" />
    <link href="assets/styles/cloud-zoom.css" rel="stylesheet" />
    <link href="assets/styles/slick.css" rel="stylesheet" />
    <link href="assets/styles/nivo-slider.css" rel="stylesheet" />
    <link href="assets/styles/jquery.bxslider.css" rel="stylesheet" />
    <link href="assets/styles/jquery.fancybox.css" rel="stylesheet" />
    <link href="assets/styles/site.css" rel="stylesheet" type="text/css" />
    <link href="assets/styles/site-repond.css" rel="stylesheet" type="text/css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 8]>
        <link href="assets/styles/ie7.css" rel="stylesheet" />
    <![endif]-->
    <!--[if lt IE 9]>
        <style type="text/css">
            .corner
            { 
                behavior: url(PIE.htc); 
            }
            .fullbox-img, .full-boxbg
            {
	            -ms-behavior: url(backgroundsize.min.htc);
	            behavior: url(backgroundsize.min.htc);
            }
        </style>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE8.js" type="text/javascript"></script>
    <![endif]-->
    <script src="assets/js/jquery.js" type="text/javascript"></script>
    <script src="assets/js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="assets/js/hoverIntent.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <header class="intro-head">
            <div class="container">
                <div class="row">
                    <div class="pull-right">
                        <p class="intro-hotline">0907440881 <span>(Mr. Tấn)</span>&nbsp;&nbsp; 0909440881 <span>(Ms. Thuận)</span></p>
                    </div>
                    <div class="pull-left">
                        <i class="fa fa-home"></i>
                        <span class="intro-local">702 Tên lửa, P. Bình Trị Đông B, Q.Bình Tân, Tp.HCM</span>
                    </div>
                </div>
            </div>
        </header>
    <main class="intro-main-content">
		<div class="container">
			<div class="row">
				<div class="intro-logo">
					<a href="~/" runat="server"><img src="assets/images/intro-logo.png" alt=""></a>
				</div>
				<div id="main-intro" class="">
					<div class="center">
						<p>Chuyên <br><span>cung cấp</span></p>
						<ul>
							<li><a href="javasript:void(0);">Tư vấn</a></li>
							<li><a href="javasript:void(0);">Thiết kế</a></li>
							<li><a href="javasript:void(0);">Thi công</a></li>
						</ul>
						<div class="intro-detail">
				            <p>Phục vụ tư vấn<strong class="bold">Xem mẫu tại nhà</strong></p>
				        </div>
					</div>
					<div class="left pull-left">
                        <asp:ListView ID="lstBannerGiay" runat="server" DataSourceID="odsBannerGiay"
                            EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="left-img"><a href="http://www.giaydantuongsacmau.com/Default.aspx">
                                    <img alt='<%# Eval("FileName") %>' src='<%# !string.IsNullOrEmpty(Eval("FileName").ToString()) ? "~/res/advertisement/" + Eval("FileName") : "~/assets/images/gdt.png" %>' runat="server" /></a></div>
						        <p><a href="http://www.giaydantuongsacmau.com/Default.aspx">Giấy dán tường</a></p>
						        <div class='<%# Eval("IsAvailable").ToString().Equals("True") ? "km-left dl-visible" : "km-left dl-hidden" %>'>
							        <p>khuyến mãi khủng</p>
							        <span><a href="http://www.giaydantuongsacmau.com/khuyen-mai.aspx">xem ngay</a></span>
						        </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsBannerGiay" runat="server" SelectMethod="AdsBannerSelectAll"
                            TypeName="TLLib.AdsBanner">
                            <SelectParameters>
                                <asp:Parameter Name="StartRowIndex" Type="String" />
                                <asp:Parameter Name="EndRowIndex" Type="String" />
                                <asp:Parameter DefaultValue="7" Name="AdsCategoryID" Type="String" />
                                <asp:Parameter Name="CompanyName" Type="String" />
                                <asp:Parameter Name="Website" Type="String" />
                                <asp:Parameter Name="FromDate" Type="String" />
                                <asp:Parameter Name="ToDate" Type="String" />
                                <asp:Parameter Name="IsAvailable" Type="String" />
                                <asp:Parameter Name="Priority" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
					</div>
					<div class="right pull-right">
					    <asp:ListView ID="ListView1" runat="server" DataSourceID="odsBannerGo"
                            EnableModelValidation="True">
                            <ItemTemplate>
						        <div class="right-img">
						            <a href="Default.aspx"><img id="Img1" alt='<%# Eval("FileName") %>' src='<%# !string.IsNullOrEmpty(Eval("FileName").ToString()) ? "~/res/advertisement/" + Eval("FileName") : "~/assets/images/gdt.png" %>' runat="server" /></a></div>
						        <p><a href="Default.aspx">Sàn gỗ cao cấp</a></p>
						        <div class='<%# Eval("IsAvailable").ToString().Equals("True") ? "km-right dl-visible" : "km-right dl-hidden" %>'>
							        <p>khuyến mãi khủng</p>
							        <span><a href="khuyen-mai.aspx">xem ngay</a></span>
						        </div>
                        </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsBannerGo" runat="server" SelectMethod="AdsBannerSelectAll"
                            TypeName="TLLib.AdsBanner">
                            <SelectParameters>
                                <asp:Parameter Name="StartRowIndex" Type="String" />
                                <asp:Parameter Name="EndRowIndex" Type="String" />
                                <asp:Parameter DefaultValue="8" Name="AdsCategoryID" Type="String" />
                                <asp:Parameter Name="CompanyName" Type="String" />
                                <asp:Parameter Name="Website" Type="String" />
                                <asp:Parameter Name="FromDate" Type="String" />
                                <asp:Parameter Name="ToDate" Type="String" />
                                <asp:Parameter Name="IsAvailable" Type="String" />
                                <asp:Parameter Name="Priority" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
					</div>
					<div class="intro-copyright">
						<p>© 2016 Sac Mau - All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
		<div id="mapshow">
        </div>
	</main>
    <script src="assets/js/imagesloaded.pkgd.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/js/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="assets/js/isotope.pkgd.min.js" type="text/javascript"></script>
    <script src="assets/js/jquery.panel.mobile.js" type="text/javascript"></script>
    <script src="assets/js/superfish.js"></script>
    <script src="assets/js/jquery.textheight.js" type="text/javascript"></script>
    <script src="assets/js/jquery.bgbox.js" type="text/javascript"></script>
    <script src="assets/js/cloud-zoom.js"></script>
    <script src="assets/js/jquery.nivo.slider.pack.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/jquery.bxslider.min.js"></script>
    <script src="assets/js/jquery.menu.level.js"></script>
    <script src="assets/js/jquery.fancybox.pack.js"></script>
    <script src="assets/js/jquery.main.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $('#slider').nivoSlider({
                pauseOnHover: false
            });
        });
    </script>
    </form>
</body>
</html>
