<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RSS_Reader.Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href = "Semantic/css/semantic.min.css" rel="Stylesheet"/>
    <title>RSS Reader</title>
</head>
    <body>
        <h2 class="ui inverted black block header">
          <i class="rss icon"></i>
          <div class="content">
            RSS Reader
            <div class="sub header">Click on the RSS icon in the corner of the Article to follow link.</div>
          </div>
        </h2>

        <form id="form1" runat="server" cssclass="ui loading form segment">
            <div class="ui inverted menu">
              <div class="left menu">
                <div class="item">
                    <div>
                        <asp:DropDownList CssClass="ui selection dropdown" runat="server" ID="dropdownFeeds" OnSelectedIndexChanged="SelectedIndexChanged_FeedsDropDown" Font-Bold="true" AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                </div>
              </div>
              <div class="right menu">
                <div class="item">
                  <div>
                        <asp:Button ID="Button1" class="circular ui inverted black button"  runat="server" Text="Add" OnClick="OnClick_DisplayAddRrsFeedPage">
                        </asp:Button>
                  </div>
                </div>
              </div>
            </div>

            <h2>
                <asp:Label ID ="labelTitle" runat="server" CssClass="ui inverted black ribbon label" Visible="false"></asp:Label>
            </h2>

          <asp:Repeater ID="FeedRepeater" runat="server">
              <HeaderTemplate>
              </HeaderTemplate>

              <ItemTemplate>
              <div class="ui items">
                  <div class="item" style="width: 350px; height: 550px;" >
                        <div class="image">
                            <img src='<%# Eval("ImageUrl") %>' alt="No Image">
                                <a class="ui corner label" href='<%# Eval("Link") %>'">
                                    <i class="orange rss icon link icon"></i>
                                </a>
                        </div>
                        <div class="content">
                            <div class="name">
                                <asp:Label runat="server" ID="Label1" text='<%# Eval("Title") %>' />
                            </div>
                                <p class="description">
                                    <asp:Label runat="server" ID="Label2" text='<%# Eval("Summary") %>' />
                                </p>
                            <div class="extra">
                                <asp:Label runat="server" ID="Label3" text= '<%# Eval("PublishDate")%>' />
                            </div>
                            <div class="ui icon button">
                              <i class="flag icon"></i>
                            </div>
                        </div>
                    </div>
              </ItemTemplate>
              <FooterTemplate>
                  </table>
              </FooterTemplate>
          </asp:Repeater>
          </div>
          </div>
        </div>
        <asp:PlaceHolder ID="phScript" runat="server">
                <script type="text/javascript">

                </script>
       </asp:PlaceHolder>
       </form>
    </body>
</html>
