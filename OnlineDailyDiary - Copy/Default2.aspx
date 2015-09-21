<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label Visible=false ID="lblResult" runat="server" />
          <recaptcha:RecaptchaControl
              ID="recaptcha"
              runat="server"
              Theme="red"
              PublicKey="6LeqhwgTAAAAAAYJwGqoW7rj_mwURHFyKoGTAMjY"
              PrivateKey="6LeqhwgTAAAAAIx_3wEJplji1OCGxrbH2-iHv4XC"
              />

          <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    </div>
    </form>
</body>
</html>
