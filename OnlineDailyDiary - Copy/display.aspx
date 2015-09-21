<%@ Page Language="C#" AutoEventWireup="true" CodeFile="display.aspx.cs" Inherits="display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="display.css" rel="stylesheet" />
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="content">
        <div id="table-content">

            <table class=" table-bordered auto-style1">
                <thead>
                    <tr>
                        <th>Messages</th>
                        
                        
                    </tr>
                </thead>
                <tbody>
                    <asp:Panel ID="table_panel" runat="server" Visible="true" >
                        
                    </asp:Panel>
                </tbody>
              

            </table>

        </div>
    </div>
          <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </form>
</body>
</html>
