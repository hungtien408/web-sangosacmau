<%@ Page Title="" Language="C#" MasterPageFile="~/site-product.master" AutoEventWireup="true"
    CodeFile="lien-he.aspx.cs" Inherits="lien_he" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.40412.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2012.3.1016.35, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Liên Hệ</title>
    <meta name="description" content="Liên Hệ" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrap-contact">
        
    <div class="row">
        <div class="col-md-6">
            <div class="address-contact">
                <h4 class="text-uppercase">
                    địa chỉ của chúng tôi</h4>
                <p>
                    <span class="fa fa-map-marker"></span>702 Tên lửa, P. Bình Trị Đông B, Q.Bình Tân,
                    Tp.HCM</p>
                <p>
                    <span class="fa fa-phone"></span>0907 440 881 ( A.Tấn ) - 0909 440 881 ( C.Thuận
                    )</p>
                <p>
                    <span class="fa fa-envelope"></span><a href="mailto:giaydantuongsacmau@yahoo.com.vn">
                        giaydantuongsacmau@yahoo.com.vn</a></p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="wrap-send">
                <h4 class="text-uppercase">
                    Chúng tôi có thể giúp gì cho bạn ?</h4>
                <div class="contact-w">
                    <%--<label class="contact-lb">Họ &amp; Tên</label>--%>
                    <div class="contact-input">
                        <asp:TextBox ID="txtFullName" CssClass="contact-textbox" runat="server"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="txtFullName_WatermarkExtender" runat="server" Enabled="True"
                            WatermarkText="Họ &amp; Tên" TargetControlID="txtFullName">
                        </asp:TextBoxWatermarkExtender>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                            Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtFullName"
                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="contact-w">
                    <%--<label class="contact-lb">Email</label>--%>
                    <div class="contact-input">
                        <asp:TextBox ID="txtEmail" CssClass="contact-textbox" runat="server"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="txtEmail_WatermarkExtender" runat="server" Enabled="True"
                            WatermarkText="Email" TargetControlID="txtEmail">
                        </asp:TextBoxWatermarkExtender>
                        <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                            runat="server" ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Email sai định dạng!"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                            ForeColor="Red"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                            ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Thông tin bắt buộc!"
                            Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="contact-w">
                    <%--<label class="contact-lb">Lời nhắn</label>--%>
                    <div class="contact-input">
                        <asp:TextBox ID="txtNoiDung" CssClass="contact-area" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="txtNoiDung_WatermarkExtender" runat="server" Enabled="True"
                            WatermarkText="Lời nhắn" TargetControlID="txtNoiDung">
                        </asp:TextBoxWatermarkExtender>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                            ValidationGroup="SendEmail" Display="Dynamic" ControlToValidate="txtNoiDung"
                            ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="contact-w">
                            <div class="contact-input">
                                <div class="wcodes">
                                    <asp:TextBox ID="txtVerifyCode" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="txtVerifyCode_WatermarkExtender" runat="server"
                                        Enabled="True" WatermarkText="Code" TargetControlID="txtVerifyCode">
                                    </asp:TextBoxWatermarkExtender>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="contact-w">
                            <div class="contact-input">
                                <div class="wcodes">
                                    <asp:RadCaptcha ID="RadCaptcha1" ForeColor="Red" Font-Bold="true" ValidationGroup="SendEmail"
                                        runat="server" ErrorMessage="+ Mã an toàn: không chính xác." ValidatedTextBoxID="txtVerifyCode"
                                        Display="Dynamic">
                                        <CaptchaImage Height="35" Width="135" RenderImageOnly="True" />
                                    </asp:RadCaptcha>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="contact-w">
                    <div class="contact-btn">
                        <asp:Label runat="server" ID="lblMessage" ForeColor="red"></asp:Label>
                        <asp:Button ID="btGui" CssClass="button-btn" runat="server" Text="Gởi lời nhắn" ValidationGroup="SendEmail"
                            OnClick="btGui_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="mapshow">
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
