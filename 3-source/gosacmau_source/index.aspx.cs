using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Sàn Gỗ TPHCM";
        var meta = new HtmlMeta() { Name = "description", Content = "Sàn Gỗ Sác Màu chuyên cung cấp các loại sàn gỗ cao cấp tại TPHCM. Gọi ngay để được tư vấn Sàn Gỗ tốt nhất!" };
        Header.Controls.Add(meta);
    }
}