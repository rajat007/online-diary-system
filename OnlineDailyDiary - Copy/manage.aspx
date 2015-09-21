<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manage.aspx.cs" Inherits="manage" %>

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
        <div class="col-lg-2"></div>
        <div class="col-lg-10">
            <div>
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="365px" Width="791px" OnSelectionChanged="Calendar1_SelectionChanged">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </div>
        </div>
    </div>

</asp:Content>

