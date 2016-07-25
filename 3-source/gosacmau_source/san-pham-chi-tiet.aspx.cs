using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class san_pham_chi_tiet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["pi"]))
            {
                var oProductCategory = new ProductCategory();
                var oProduct = new Product();
                var dv = oProduct.ProductSelectOne(Request.QueryString["pi"]).DefaultView;
                var dv2 = oProductCategory.ProductCategorySelectOne(Request.QueryString["pci"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["ProductName"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTittle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());

                hdnSanPhamDetails.Value = progressTitle(dv2[0]["ProductCategoryName"].ToString()) + "-pci-" + dv2[0]["ProductCategoryID"].ToString() + ".aspx";

                //if (row["RootID"].ToString().Equals("1"))
                //{
                //    lblContent.Text =
                //        "<p><span style='font-styles:italic; font-weight:bold; text-decoration: underline;'>Quy cách:</span> 106cm x 15.6m = 16.5m2</p><br/><p style='font-styles:italic; font-weight:bold; text-decoration: underline; margin: 0;'>Đặc tính:</p>- Bề mặt phủ clemastic.<br/>- Có khả năng chịu kiềm, axit.<br/>- Không phai màu, bạc màu.<br/>- Khó bám bẩn, chống rêu mốc.<br/>- Dể thi công, không bụi bẩn khi dán.<br/>- Dán được trên mọi bề mặt dể dàng với độ bám dính cao.<br/>- Thân thiện với môi trường, không chất độc hại.<br/><br/><p style='font-styles:italic; font-weight:bold; text-decoration: underline; margin: 0;'>Chế độ bảo hành:</p>- Bảo hành lỗi kỹ thuật thi công, lỗi sản phẩm.<br/>- Không bảo hành do tường ẩm, trầy tróc, vật cứng tác động.";
                //}
                //else if (row["RootID"].ToString().Equals("4"))
                //{
                //    lblContent.Text =
                //        "Tranh dán tường là một sản phẩm rất “Hot” trong cuộc sống hiện nay. Nó sẽ đem lại cho không gian nhà bạn mát mẻ hơn, ấn tượng hơn và đặc biệt là tạo nguồn cảm hứng sáng tạo cho con em mình với nhiều tranh ảnh rất dể thương dành cho trẻ em.<br/><br/>Tranh dán tường có 2 loại:<br/><br/><ul><li>In trên giấy Hàn Quốc: Giá 290.00đ/m2<ul style='list-style: none;'><li>+ Có độ bền lâu.</li><li>+ Dể dán trên mọi bề mặt: Tường gổ, kính, thạch cao…</li><li>+ Không chóa với ánh đèn.</li></ul></li><li>In trên giấy PP:Giá 180.000đ/m2<ul style='list-style: none;'><li>+ Độ nét cao.</li><li>+ Độ bền hạn chế, Không dán được trên nền giấy đã dán trước đó.</li><li>+ Bị chóa với ánh đèn.</li></ul></li><li>Đặc tính chung:<ul style='list-style: none;'><li>+ Dể dán, thân thiện với môi trường.</li><li>+ Tạo không gian thoáng mát, gần gủi với thiên nhiên.</li><li>+ Có nhiều hình ảnh để lựa chọn.</li><li>+ Kích thước in theo yêu cầu.</li><li>+ ...</li></ul></li></ul>";
                //}
                var dv3 = oProductCategory.ProductCategorySelectOne(row["RootID"].ToString()).DefaultView;
                var dv4 = oProductCategory.ProductCategorySelectOne(Request.QueryString["pci"]).DefaultView;
                if (dv3[0]["Content"].ToString().Equals(""))
                    lblContent.Visible = false;
                else
                    lblContent.Text = dv3[0]["Content"].ToString();

                if (dv4[0]["Content"].ToString().Equals(""))
                    lblContent1.Visible = false;
                else
                    lblContent1.Text = dv4[0]["Content"].ToString();
            }
            else
            {
                strTitle = strMetaTitle = "Sản Phẩm";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta() { Name = "description", Content = !string.IsNullOrEmpty(strMetaDescription) ? strMetaDescription : strDescription };
            Header.Controls.Add(meta);

            //lblTitle.Text = strTitle;
        }
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
}