<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="Setting" %>

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
                <li>
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
                <li class="Active">
                    <div class="col-lg-2">
                        <a href="Setting.aspx">
                            <h4>Settings</h4>
                        </a>
                    </div>
                </li>

                <li>

                    <div class="col-lg-2">
                        <asp:Button CssClass="btn btn-link btn-lg" ID="Button3" runat="server" Text="Log Out" CausesValidation="false" OnClick="Button3_Click"  />
                        

                    </div>
                </li>


            </ul>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="middle" runat="Server">
    <div class="row">
        <div class="col-lg-6">
            <div class="well">
                <h4 style="font: bold; text-align: center;">Edit Profile</h4>
            </div>
            <div class="container">
                <asp:Image ID="Image1" runat="server" Height="52px" Width="114px" />
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
                <hr />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="false">
                    <Columns>
                        <asp:BoundField DataField="Text" />
                        <asp:ImageField DataImageUrlField="Value" ControlStyle-Height="100" ControlStyle-Width="100" />
                    </Columns>
                </asp:GridView>
            </div>

        </div>



        <div class="col-lg-6">
            <div class="well">
                <h4 style="font: bold; text-align: center;">Change Password</h4>
            </div>

            <table border="0">
                <tr>
                    <th colspan="3">
                        <h3 style="padding: 5px;"></h3>
                    </th>
                </tr>



                <tr>
                    <td>
                        <p style="padding: 5px;">Password</p>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPassword" ValidationGroup="signup"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator runat="server" Display="dynamic"
                            ControlToValidate="txtPassword"
                            ErrorMessage="Password must contain one of @#$%^&*/."
                            ValidationExpression=".*[@#$%^&*/].*" />
                        <asp:RegularExpressionValidator runat="server" Display="dynamic"
                            ControlToValidate="txtPassword"
                            ErrorMessage="Password must be 4-12 nonblank characters."
                            ValidationExpression="[^\s]{4,12}" />
                    </td>

                </tr>

                <tr>
                    <td>
                        <p style="padding: 5px;">New Password</p>
                    </td>
                    <td>
                        <asp:TextBox ID="newtxtPassword" runat="server" TextMode="Password" Height="22px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="newtxtPassword" ValidationGroup="signup"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator runat="server" Display="dynamic"
                            ControlToValidate="txtPassword"
                            ErrorMessage="Password must contain one of @#$%^&*/."
                            ValidationExpression=".*[@#$%^&*/].*" />
                        <asp:RegularExpressionValidator runat="server" Display="dynamic"
                            ControlToValidate="txtPassword"
                            ErrorMessage="Password must be 4-12 nonblank characters."
                            ValidationExpression="[^\s]{4,12}" />
                    </td>

                </tr>

                <tr>
                    <td>
                        <p style="padding: 5px;">Confirm New Password</p>
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtConfirmPassword"></asp:RequiredFieldValidator>

                    </td>

                    <td>
                        <asp:CompareValidator runat="server"
                            ControlToValidate="txtConfirmPassword"
                            ControlToCompare="txtPassword"
                            ErrorMessage="Passwords do not match." /></td>

                </tr>




                <tr>
                    <td></td>
                    <td>
                        <asp:Button CssClass="btn btn-default"
                            ID="Button1"
                            runat="server"
                            Text="Submit" OnClick="Button1_Click" /></td>
                </tr>

            </table>

        </div>

    </div>



</asp:Content>

