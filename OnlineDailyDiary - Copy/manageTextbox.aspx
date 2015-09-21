<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageTextbox.aspx.cs" Inherits="manageTextbox" %>

<%@ Register Assembly="ASPNetSpell" Namespace="ASPNetSpell" TagPrefix="ASPNetSpell" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headercol2" runat="Server">
      <div class="row">
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li>
                    <div class="col-lg-2">
                        <a href="home.aspx">
                            <h4>Home</h4>
                        </a>
                    </div>
                </li>
                <li class="Active">
                    <div class="col-lg-2">
                        <a href="manage.aspx">
                            <h4>Manage</h4>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="col-lg-2">
                        <a href="Friends.aspx">
                            <h4>Friends</h4>
                        </a>
                    </div>
                </li>
                <li >
                    <div class="col-lg-2">
                        <a href="Setting.aspx">
                            <h4>Settings</h4>
                        </a>
                    </div>
                </li>

                <li>

                    <div class="col-lg-2">
                        

                        <asp:Button CssClass="btn btn-link btn-lg" ID="Button1" runat="server" Text="Log Out" OnClick="Button1_Click" />
                    </div>
                </li>


            </ul>
        </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="middle" runat="Server">
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">

            <script src="ckeditor/ckeditor.js"></script>
            <!-- <textarea id="TextArea1" cols="20" rows="2" style="width: 1052px; height: 385px;"></textarea>-->
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <CKEditor:CKEditorControl ID="editor1" BasePath="/ckeditor/" runat="server" Toolbar="
Bold|Italic|Underline|Strike|-|Subscript|Superscript
NumberedList|BulletedList|-|Outdent|Indent
/
Styles|Format|Font|FontSize|TextColor|BGColor"></CKEditor:CKEditorControl>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div style="text-align: center">
                <asp:Button CssClass="btn btn-default" ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="share" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database1ConnectionString %>" ProviderName="<%$ ConnectionStrings:Database1ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [data]"></asp:SqlDataSource>
</asp:Content>


