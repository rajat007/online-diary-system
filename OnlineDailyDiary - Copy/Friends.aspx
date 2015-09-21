<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Friends.aspx.cs" Inherits="Friends" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headercol2" runat="Server">
    <div class="row">
        <div class="navbar-collapse collapse">

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
            <li class="Active">
                <div class="col-lg-2">
                    <a href="friends.aspx">
                        <h4>Friends</h4>
                    </a>
                </div>
            </li>
            <li>
                <div class="col-lg-2">
                    <a href="Setting.aspx">
                        <h4>Settings</h4>
                    </a>
                </div>
            </li>

            <div class="col-lg-2">


                <asp:Button CssClass="btn btn-link btn-lg" ID="Button3" runat="server" Text="Log Out" OnClick="Button3_Click" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="middle" runat="Server">
    <div class="row">
        <div class="col-lg-3">
            <p class="text-info" style="text-align: right; font-weight: bold;">search your friends:</p>

        </div>
        <div class="col-lg-4">
            <div class="row">
                <div class="col-lg-5">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div class="col-lg-7">
                    <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
                    <asp:Label ID="Label1" runat="server" Text="FRIEND is not exist"></asp:Label>
                </div>
            </div>

        </div>


    </div>

    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-7">
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-11">
                    <asp:Button ID="Button2" runat="server" Text="Add Friend" OnClick="Button2_Click" />
                </div>
            </div>


        </div>

    </div>
    <div class="row">
        <div class="col-lg-1"></div>

        <div class="col-lg-8">
            <!--modal popup-->

            <asp:Button ID="ButtonMessage" runat="server" Text="Messages" OnClick="ButtonMessage_Click" />





            <p>MESSAGES:</p>

            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSource2" PageSize="4"
                OnRowDataBound="GridView1_RowDataBound"
                Style="position: static" Width="100%" Visible="False">

                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />

            </asp:GridView>








            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:diaryConnectionString %>" SelectCommand="SELECT [message] FROM [share] WHERE ([username] = @username)">
                <SelectParameters>
                    <asp:SessionParameter Name="username" SessionField="username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>



        <div class="col-lg-3">
            <asp:Button ID="ButtonFriend" runat="server" Text="Friend List" OnClick="ButtonFriend_Click" />
            <p>Your Friends:</p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Visible="False">

                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />

                <Columns>
                    <asp:BoundField DataField="add_friends" HeaderText="Your Friends" SortExpression="add_friends" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:diaryConnectionString %>" SelectCommand="SELECT DISTINCT [add friends] AS add_friends FROM [Friends] WHERE ([friend] = @friend)">
                <SelectParameters>
                    <asp:SessionParameter Name="friend" SessionField="username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>


    </div>




</asp:Content>

