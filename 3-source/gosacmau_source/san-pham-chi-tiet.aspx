<%@ Page Title="" Language="C#" MasterPageFile="~/site-product.master" AutoEventWireup="true"
    CodeFile="san-pham-chi-tiet.aspx.cs" Inherits="san_pham_chi_tiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>SM</title>
    <meta name="description" content="SM" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnSanPhamDetails" runat="server" />
    <a class="a-link-spc" href="<%= hdnSanPhamDetails.Value %>"></a>
    <asp:ListView ID="lstProductDetails" runat="server" DataSourceID="odsProductDetails"
        EnableModelValidation="True">
        <ItemTemplate>
            <div class="wrapper-details">
                <div id="sliderDetails" class="detail-images">
                    <div class="wrap-images">
                        <asp:ListView ID="lstProductAlbum" runat="server" DataSourceID="odsProductAlbum"
                            EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="slide">
                                    <div class="images-box box-img fullbox-img contain-img">
                                        <div class="icon-pro">
                                            <img class="img-responsive" src="assets/images/watermark.png" alt="" />
                                        </div>
                                        <img class="hideo" id="Img1" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/details-img-1.jpg" %>'
                                            runat="server" />
                                        <a class="zoom-images fancybox desktop-showhide" data-fancybox-group="gallery" href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/details-big-1.jpg" %>'>
                                            zoom</a>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <%--<div class="detailimg-desktop">
                                    <div class="zoom-box">
                                        <a id="zoom1" href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/details-big-2.jpg" %>'
                                            class="cloud-zoom" rel="showTitle: false, adjustY:0, adjustX:5">
                                            <img class="img-responsive" src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/details-img-2.jpg" %>'
                                                alt="" />
                                        </a>
                                    </div>
                                </div>--%>
                                <div class="slider-for">
                                    <span runat="server" id="itemPlaceholder" />
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>
                    <div class="wrapper-in">
                        <div class="wrapper-7">
                            <asp:ListView ID="lstProductAlbumBig" runat="server" DataSourceID="odsProductAlbum"
                                EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="slide">
                                        <a href="javascript:void(0);" class="small-img"><span class="box-img fullbox-img contain-img">
                                            <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/details-small-1.jpg" %>'
                                                runat="server" /></span> </a>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div class="slider-nav">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </div>
                <asp:ObjectDataSource ID="odsProductAlbum" runat="server" SelectMethod="ProductImageSelectAll"
                    TypeName="TLLib.ProductImage">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="pi" Name="ProductID" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <div class="details-content">
                    <h4 class="product-name">
                        <%# Eval("ProductCategoryName") %></h4>
                    <%--  <div class="product-code">
                        <%# Eval("Tag") %></div>--%>
                    <div class="desription">
                        <ul class="list-info">
                            <%--<li><strong>Thương hiệu:</strong> Manufacturer</li>--%>
                            <li><strong>Mã sản phẩm (ID):</strong>
                                <%# Eval("Tag") %></li>
                            <li><strong>Giá bán:</strong> <del>
                                <%# (string.Format("{0:##,###.##}", Eval("SavePrice")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) %><%# string.IsNullOrEmpty(Eval("SavePrice").ToString()) ? "" : "đ"%></del>
                                <strong>
                                    <%# string.IsNullOrEmpty(Eval("OtherPrice").ToString()) ?(string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) :  Eval("OtherPrice") %><%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "" : "đ"%></strong></li>
                        </ul>
                        <p style="font-size: 16px;">
                            <%--<strong>Liên hệ trực tiếp để có giá tốt nhất</strong><br />--%>
                            <strong style="color: #f00;">Hotline:</strong> <span style="color: #f00; font-size: 16px;
                                font-style: italic;">0907 440 881 ( A.Tấn ) - 0909 440 881 ( C.Thuận )</span></p>
                        <p>
                            Hoặc Email: <a style="color: #000; font-style: italic;" href="mailto:giaydantuongsacmau@yahoo.com.vn">
                                <strong>giaydantuongsacmau@yahoo.com.vn</strong></a></p>
                    </div>
                </div>
                <div class="clr">
                </div>
            </div>
            <div class="wrapper-text">
                <h4 class="title text-uppercase">
                    Mô tả sản phẩm</h4>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <%--<div class="wrapper-text">
        <h4 class="title text-uppercase">
            Mô tả sản phẩm</h4>
        <asp:Label ID="lblContent" runat="server"></asp:Label>
        <asp:Label ID="lblContent1" runat="server"></asp:Label>
    </div>--%>
    <asp:ObjectDataSource ID="odsProductDetails" runat="server" SelectMethod="ProductSelectOne"
        TypeName="TLLib.Product">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <div class="head head-bg">
        <h4 class="text-uppercase title-in title-same">
            <span>SẢN PHẨM Tương tự</span></h4>
        <div data-id="silderProduct" class="control-slider">
            <a href="javascript:void(0);" class="prev"><span class="fa fa-angle-left"></span>
            </a><a href="javascript:void(0);" class="next"><span class="fa fa-angle-right"></span>
            </a>
        </div>
    </div>
    <div class="wrap-content">
        <div class="pro-row">
            <%--<asp:ListView ID="lstProductSame" runat="server" DataSourceID="odsProductSame" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="slide">
                        <div class="product-box">
                            <div class="icon-pro">
                                <img class="img-responsive" src="assets/images/logo3.png" alt="" />
                            </div>
                            <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                                class="product-img corner"><span class=" box-img fullbox-img cover-img">
                                    <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/product-img-1.jpg" %>'
                                        runat="server" /></span></a>
                            <h4 class="product-name">
                                <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                    <%# Eval("ProductName") %>
                                    <%# Eval("ProductCategoryName") %></a></h4>
                            <div class="product-code">
                                Mã số :
                                <%# Eval("Tag") %></div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="silderProduct" class="list-pro">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>--%>
            <asp:ListView ID="lstProduct" runat="server" DataSourceID="odsProductSame" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="col-lg-3 col-xs-4 element-item">
                        <div class="product-box">
                            <div class="icon-pro">
                                <img class="img-responsive" src="assets/images/watermark.png" alt="" />
                            </div>
                            <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                                class="product-img corner"><span class=" box-img fullbox-img cover-img">
                                    <img id="Img2" class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/product-img-1.jpg" %>'
                                        runat="server" /></span></a>
                            <h4 class="product-name">
                                <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                    <%# Eval("ProductCategoryName") %></a></h4>
                            <div class="product-code">
                                Mã số :
                                <%# Eval("Tag") %></div>
                        </div>
                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <span>Ðang cập nhật.</span>
                </EmptyDataTemplate>
                <LayoutTemplate>
                    <div class="row product-tb">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsProductSame" runat="server" SelectMethod="ProductSameSelectAll"
                TypeName="TLLib.Product">
                <SelectParameters>
                    <asp:Parameter DefaultValue="12" Name="RerultCount" Type="String" />
                    <asp:QueryStringParameter DefaultValue="" Name="ProductID" QueryStringField="pi"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
