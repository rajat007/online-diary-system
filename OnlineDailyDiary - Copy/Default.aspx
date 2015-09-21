<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>


<asp:Content ID="content1" ContentPlaceHolderID="headercol2" runat="server">
    <div class="row">

        <div class="col-lg-4">
            <h4>UserName</h4>
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexpSSN" runat="server"
                ErrorMessage="Dont be Smart.YOU cant CRACK it!!!"
                ControlToValidate="username"
                ValidationExpression="^[a-zA-Z0-9_]+$" />
        </div>
        <div class="col-lg-4">

            <h4>Password</h4>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
          

        <div class="col-lg-4">
          <span class="glyphicon glyphicon-log-in" style="padding:10px;" ></span> 
            <br />
            <asp:Button CssClass="btn btn-default" ID="Button2" runat="server" Text="Log In" CausesValidation="true" ValidationGroup="login" OnClick="Button2_Click" />
            
            <br />
        </div>
         

    </div>
</asp:Content>

<asp:Content ID="content2" ContentPlaceHolderID="middle" runat="server">

    <div class="row">
        <div class="col-lg-7">

            <p class="text-info" style="font-size: large; text-align:center;">Leave the future You something to look back on!</p>
            <div class="diary-holder">
                <div class="diary-container">
                    <div class="diary">
                        <div class="diary-cover">
                            <div class="cover"></div>
                        </div>
                        <div class="diary-spine">
                            <h1>Diary4U</h1>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-lg-5">
            <div>

                <table border="0">
                    <tr>
                        <th colspan="3">
                            <h3 style="padding: 5px;">Sign Up</h3>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <p style="padding: 5px;">Name</p>
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server"  />
                                                      
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtName" ValidationGroup="signup"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <p style="padding: 5px;">Username</p>
                        </td>
                        <td>
                           <asp:UpdatePanel runat="server">
                               <ContentTemplate>
                            <asp:TextBox ID="txtUsername" runat="server"  autopostback="true" OnTextChanged  ="txtUsername_TextChanged" />
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtUsername" ValidationGroup="signup"></asp:RequiredFieldValidator>
                        </td>
                        <td>

                            <asp:Label ID="Label1" runat="server"></asp:Label>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Your UserName" ControlToValidate="txtUsername" ValidationGroup="signup"></asp:RequiredFieldValidator>
                           </ContentTemplate>
                             </asp:UpdatePanel>

                        </td>
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
                            <p style="padding: 5px;">Confirm Password</p>
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
                        <td>
                            <p style="padding: 5px;">Email</p>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" />
                        </td>
                        <td>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1"
                                runat="server"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtEmail"
                                ErrorMessage="Input valid email address!">
                            </asp:RegularExpressionValidator></td>
                    </tr>
                     <tr>
                         <td colspan="3"><div class="g-recaptcha" id="rcaptcha" data-sitekey="6Le6kggTAAAAAAVyN73pvd2E9b8Gh_98wEuzKKSt"></div></td>
                     </tr>
                        
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button CssClass="btn btn-default"
                                ID="Button1"
                                runat="server"
                                Text="Submit"
                                OnClick="Button1_Click" /></td>
                    </tr>
                   
                       
                      
                </table>
            </div>

        </div>
    </div>
</asp:Content>

<%--  --%>
