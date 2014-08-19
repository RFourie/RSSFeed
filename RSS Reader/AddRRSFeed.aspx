<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRRSFeed.aspx.cs" Inherits="RSS_Reader.AddRRSFeed" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="semantic/css/semantic.min.css" rel="stylesheet"/>
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
        <div align="center">
            <div class="ui one column middle aligned grid basic segment" style="width:550px; padding: 60px">
                <div class="column">
                    <div class="ui tertiary form segment" >
                        <div align="center">
                            <div class="ui icon header">
                                <i class="circular inverted black rss icon"></i>Create RRS Feed
                            </div>
                        </div>
                            <p></p>

                        <div class="ui inverted black ribbon label">Enter Feed Title:</div>
                        <p></p>

                            <div class="ui labeled input">
                                <input type="text" placeholder="Title..." runat="server" ID="txtTitle">
                                    <div class="ui corner label">
                                        <i class="pencil icon"></i>
                                </div>
                            </div>
                        <p></p>

                        <div class="ui inverted black ribbon label">Enter URL:</div>
                        <p></p>

                            <div class="ui labeled input">
                                <input type="text" placeholder="http://feeds.news24.com/articles/news24/TopStories/rss..." runat="server" ID="txtUrl">
                                    <div class="ui corner label">
                                        <i class="pencil icon"></i>
                                </div>
                            </div>
                        <p></p>
                        
                        <div align="center">
                            <div>
                                <asp:button ID="Button3" runat="server" CssClass="small circular ui inverted black button" Text="Create" OnClick="click_Create"/>
                            </div>
                            <div class="ui horizontal divider">
                                Or
                            </div>
                            <div>
                                <asp:button ID="Button4" runat="server" CssClass="mini circular ui inverted black button" Text="Cancel" OnClick="click_Cancel"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
