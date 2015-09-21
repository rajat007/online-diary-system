<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headercol2" runat="Server">

    <div class="row">
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="Active">
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
                <li >
                    <div class="col-lg-2">
                        <a href="Setting.aspx">
                            <h4>Settings</h4>
                        </a>
                    </div>
                </li>

                <li>

                    <div class="col-lg-2">
                        

                        <asp:Button CssClass="btn btn-link btn-lg" ID="Button2" runat="server" Text="Log Out" onclick="Button2_Click"/>
                    </div>
                </li>


            </ul>
        </div>
    </div>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="middle" runat="Server">

    <!-- Start WOWSlider.com BODY section -->
    <!-- add to the <body> of your page -->
    <div id="wowslider-container1">
        <div class="ws_images">
            <ul>
                <li>
                    <img src="data1/images/diary001.jpg" alt="diarydone" title="diarydone" id="wows1_0" /></li>
                <li>
                    <img src="data1/images/diaryy.jpg" alt="diaryy" title="diaryy" id="wows1_1" /></li>
                <li><a href="http://wowslider.com">
                    <img src="data1/images/quotedeardiaryijustwantalifeworthwriting5838.jpg" alt="full width slider" title="quote-dear-diary-i-just-want-a-life-worth-writing-5838" id="wows1_2" /></a></li>
                <li>
                    <img src="data1/images/theanatomyofatrainingdiary.jpg" alt="The-anatomy-of-a-training-diary" title="The-anatomy-of-a-training-diary" id="wows1_3" /></li>
            </ul>
        </div>
        <div class="ws_bullets">
            <div>
                <a href="#" title="diarydone"><span>
                    <img src="data1/tooltips/diary001.jpg" alt="diarydone" />1</span></a>
                <a href="#" title="diaryy"><span>
                    <img src="data1/tooltips/diaryy.jpg" alt="diaryy" />2</span></a>
                <a href="#" title="quote-dear-diary-i-just-want-a-life-worth-writing-5838"><span>
                    <img src="data1/tooltips/quotedeardiaryijustwantalifeworthwriting5838.jpg" alt="quote-dear-diary-i-just-want-a-life-worth-writing-5838" />3</span></a>
                <a href="#" title="The-anatomy-of-a-training-diary"><span>
                    <img src="data1/tooltips/theanatomyofatrainingdiary.jpg" alt="The-anatomy-of-a-training-diary" />4</span></a>
            </div>
        </div>
        <div class="ws_script" style="position: absolute; left: -99%"><a href="http://wowslider.com/vi">jquery carousel</a> by WOWSlider.com v8.2</div>
        <div class="ws_shadow"></div>
    </div>
    <script type="text/javascript" src="engine1/wowslider.js"></script>
    <script type="text/javascript" src="engine1/script.js"></script>
    <!-- End WOWSlider.com BODY section -->

</asp:Content>

