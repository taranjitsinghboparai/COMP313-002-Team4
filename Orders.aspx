<%@ Page MasterPageFile="~/GameAddict.Master" Language="C#" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>


<asp:Content ID="HomeContentHead" ContentPlaceHolderID="GameAddictHead" runat="server">
    
                <style>
                      .buttons-div{
                          display:block;
                          margin: 10px 10px 10px 0px;
                      }
                      .my-button{
                           float: right;
                           display: inline-block;
                           padding: 5px;
                           background-color: #1a1a1a;
                           border-radius: 4px;
                           margin-left: 8px;
                           border: none;
                      }
                      .my-button a{
                          text-decoration: none;
                      }
                      .favorites:hover{
                          cursor: pointer;
                          color: #c19506;
                      }
                          .details{
                          font-size: 14px;
                      }
                      .attr{
                          display: inline-block;
                          margin: 2px;
                          margin-bottom: 5px;
                      }
                        .value{
                          display: inline-block;
                         margin-bottom: 5px;
                       }
               </style>

</asp:Content>



<asp:Content ID="HomeContentBody" ContentPlaceHolderID="GameAddictBody" runat="server">


    <asp:SqlDataSource ID="orders" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT Game.Name, Game.Image, Platform.Name AS pname, Orders.Quantity, Orders.Price, Orders.Date FROM Orders INNER JOIN GamePlatform ON Orders.GamePlatformID = GamePlatform.GamePlatformID INNER JOIN Game ON Game.GameID = GamePlatform.GameID INNER JOIN Platform ON Platform.PlatformID = GamePlatform.PlatformID WHERE (Orders.UserID = @userid) ORDER BY Orders.Date DESC">
        <SelectParameters>
            <asp:SessionParameter SessionField="userid" Name="userid"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>

  

    <div id="content">
       <div class="block">
        <div class="block-bot">
          <div class="head">
            <div class="filter" style="padding:10px;"   > 
              
              <h3 >My Orders</h3>
              <div class="cl">&nbsp;</div>
            </div>
          </div>

            <asp:DataList ID="ddl_orders" runat="server" DataSourceID="orders">

                <ItemTemplate>

                    <div class="row-articles articles">
                        <div class="cl">&nbsp;</div>

                        <div class="article last-article">
                            <div class="cl">&nbsp;</div>
                            <div class="image"><a href="#">
                                <img src='Images/Game/<%# Eval("Image") %>' alt="" /></a> </div>
                            <div class="cnt" style="margin-left: 10px;">
                                <h4 style="display: inline-block;"><a href="#"><%# Eval("Name") %></a></h4>
                                <h4 style="display: inline-block; float: right;"><span>Date: <%# Convert.ToDateTime(Eval("Date")).ToShortDateString() %></span></h4>
                                <div class="details" style="">
                                    <div class="attr" style="text-align: right;">
                                        Platform : 
           
                                    </div>
                                    <div class="value">
                                        <%# Eval("pname") %>
                                    </div>
                                    <br />

                                    <div class="attr" style="text-align: right;">
                                        Quantity : 
                       
                                    </div>
                                    <div class="value">
                                        <%# Eval("quantity") %>
                                    </div>
                                    <br />
                                    <div class="attr" style="text-align: right;">
                                        Price : 
                 
                                    </div>
                                    <div class="value">
                                        $<%# Eval("price") %>
                                    </div>
                                </div>




                            </div>
                            <div class="cl">&nbsp;</div>
                        </div>

                        <div class="divider" >&nbsp;</div>
                    </div>

                    <br />


                </ItemTemplate>

            </asp:DataList>

          

        </div>
      </div>
        </div>

    
</asp:Content>