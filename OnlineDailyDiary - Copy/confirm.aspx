<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="confirm.aspx.cs" Inherits="confirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headercol2" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="middle" runat="Server">
    <div class="row">
        <div class="col-lg-3">
        </div>
        <div class="col-lg-6">
            <h4>CODE </h4>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Verify" />
    
        </div>
        <div class="col-lg-3"></div>

    </div>

  
    
</asp:Content>

