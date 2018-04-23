using System;
using System.IO;

namespace DevExpress.UploadSim {
    public partial class Default : System.Web.UI.Page {

        protected void btnDownload_Click(object sender, EventArgs e) {
            var filepath = MapPath(txbFilename.Text);
            if(File.Exists(filepath))
                SendFile(filepath);
        }

        void SendFile(String filepath) {
            var filename = Path.GetFileName(filepath);
            var length = new FileInfo(filepath).Length;
            Response.ContentType = "octet/stream";
            Response.AppendHeader("Content-Disposition", String.Format("attachment;filename={0};", filename));
            Response.AppendHeader("Content-Length", length.ToString());
            Response.WriteFile(filepath);
            Response.End();
        }
    }
}