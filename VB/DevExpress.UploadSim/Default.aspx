'INSTANT VB NOTE: This code snippet uses implicit typing. You will need to set 'Option Infer On' in the VB file or set 'Option Infer' at the project level:

<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="DevExpress.UploadSim.Default" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFileManager" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to create a custom File Open dialog using ASPxFileManager</title>
</head>
<body>
	<script type="text/javascript">

		function ShowFilename() {
			var file = filemanager.GetSelectedFile();
			if (file) {
				var folder = filemanager.GetCurrentFolderPath();
				var relativePath = "~\\" + folder + "\\" + file.name;
				txbFilename.SetText(relativePath);
				popup.Hide();
			}
		}

	</script>
	<form id="form1" runat="server">
	<div>
	<table>
		<tr>
			<td>
				<dx:ASPxTextBox ID="txbFilename" runat="server" Width="400px" EnableClientSideAPI="true" ClientInstanceName="txbFilename">
				</dx:ASPxTextBox>
			</td>
			<td>
				<dx:ASPxButton ID="btnBrowse" runat="server" Text="Browse" AutoPostBack="false">
					<ClientSideEvents Click="function() { popup.Show(); }" />
				</dx:ASPxButton>
			</td>
		</tr>
	</table>
		<dx:ASPxPopupControl ID="popup" runat="server" ShowFooter="true" HeaderText="Select file" EnableClientSideAPI="true" ClientInstanceName="popup">
			<ContentCollection>
				<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
					<dx:ASPxFileManager ID="filemanager" runat="server" Width="800px" ClientInstanceName="filemanager">
						<settings rootfolder="~\Files\" thumbnailfolder="~\Thumb\" />
						<SettingsUpload Enabled="false" />
					</dx:ASPxFileManager>
				</dx:PopupControlContentControl>
			</ContentCollection>
			<FooterTemplate>
				<table>
					<tr>
						<td style="width:90%"></td>
						<td>
							<dx:ASPxButton ID="btnOk" runat="server" Text="OK" AutoPostBack="false">
								<ClientSideEvents Click="ShowFilename" />
							</dx:ASPxButton>
						</td>
						<td>
							<dx:ASPxButton ID="btnCancel" runat="server" Text="Cancel" AutoPostBack="false">
								<ClientSideEvents Click="function() {popup.Hide();}" />
							</dx:ASPxButton>
						</td>
					</tr>
				</table>
			</FooterTemplate>
		</dx:ASPxPopupControl>
		<br />
		<dx:ASPxButton ID="btnDownload" runat="server" Text="Download" OnClick="btnDownload_Click"></dx:ASPxButton>
	</div>
	</form>
</body>
</html>