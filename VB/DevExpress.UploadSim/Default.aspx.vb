Imports Microsoft.VisualBasic
Imports System
Imports System.IO

Namespace DevExpress.UploadSim
	Partial Public Class [Default]
		Inherits System.Web.UI.Page

		Protected Sub btnDownload_Click(ByVal sender As Object, ByVal e As EventArgs)
			Dim filepath = MapPath(txbFilename.Text)
			If File.Exists(filepath) Then
				SendFile(filepath)
			End If
		End Sub

		Private Sub SendFile(ByVal filepath As String)
			Dim filename = Path.GetFileName(filepath)
			Dim length = New FileInfo(filepath).Length
			Response.ContentType = "octet/stream"
			Response.AppendHeader("Content-Disposition", String.Format("attachment;filename={0};", filename))
			Response.AppendHeader("Content-Length", length.ToString())
			Response.WriteFile(filepath)
			Response.End()
		End Sub
	End Class
End Namespace