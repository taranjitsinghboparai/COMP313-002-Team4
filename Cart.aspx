<%@ Page MasterPageFile="~/GameAddict.Master"   Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>


<asp:Content ID="HomeContentHead" ContentPlaceHolderID="GameAddictHead" runat="server">
    
                <style>
                      .buttons-div{
                          display:block;
                          margin: 20px 10px 10px 0px;
                  
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
                      .pad-more{
                          padding: 10px;
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
                          width: 80%;
                          margin: 2px;
                          margin-bottom: 10px;
                      }
                        .value{
                          display: inline-block;
                          width: 10%;
                         margin-bottom: 10px;
                       }
                        .message{
                            color: red;
                            font-size: 18px;
                            margin-top: 80px;
                        }
               </style>

</asp:Content>

<asp:Content ID="HomeContentBody" ContentPlaceHolderID="GameAddictBody" runat="server">

    <asp:SqlDataSource ID="ShowCart" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT Cart.CartID, Cart.Quantity, Game.GameID, Game.Name, Game.Details, Game.Image, GamePlatform.DVDPrice, Platform.Name AS Expr1 FROM Cart INNER JOIN GamePlatform ON GamePlatform.GamePlatformID = Cart.GamePlatformID INNER JOIN Platform ON Platform.PlatformID = GamePlatform.PlatformID INNER JOIN Game ON GamePlatform.GameID = Game.GameID WHERE (Cart.UserID = @user_id)">
        <SelectParameters>
            <asp:SessionParameter SessionField="userid" Name="user_id"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <div id="content">
        <div class="block">


            <div class="block-bot">
                <div class="head">
                    <div class="filter" style="padding: 10px;">

                        <h3>My Cart</h3>
                        <div class="cl">&nbsp;</div>
                    </div>
                </div>


                <asp:DataList ID="ddl1" OnItemCommand="ddl1_ItemCommand" runat="server" DataSourceID="ShowCart">
                    <ItemTemplate>

                        <div class="row-articles articles">
                            <div class="cl">&nbsp;</div>

                            <div class="article last-article">
                                <div class="cl">&nbsp;</div>
                                <div class="image">
                                    <a href="#">
                                        <img src='Images/Game/<%# Eval("Image") %>' alt="" /></a>
                                </div>
                                <div class="cnt">
                                    <h4 style="display: inline-block; margin-left: 20px;"><a href="#"><%#Eval("Name") %></a></h4>

                                    <div class="details" style="display: inline-block; float: right;">
                                        <div class="attr" style="text-align: right;">
                                            Platform : 
           
                                        </div>
                                        <div class="value">
                                            <%# Eval("Expr1") %>
                                        </div>

                                        <div class="attr" style="text-align: right;">
                                            Quantity : 
                       
                                        </div>
                                        <div class="value">
                                            <%# Eval("Quantity") %>
                                        </div>
                                        <div class="attr" style="text-align: right;">
                                            Price : 
                 
                                        </div>
                                        <div class="value">
                                            $<%# price = Convert.ToInt16(Eval("Quantity")) * Convert.ToInt16(Eval("DVDPrice")) %>
                                        </div>

                                    </div>

                                    <div class="buttons-div" style="float: right; margin-left: 180px;">
                                        <asp:Button ID="btn_delete" CommandArgument='<%# Eval("cartid")%>' CommandName="cartid" ForeColor="Gray" runat="server" CssClass="my-button" Text="Delete" />
                                    </div>


                                </div>
                                <div class="cl">&nbsp;</div>
                            </div>

                            <div class="cl">&nbsp;</div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>




            </div>

            <div runat="server" id="div_totalPrice" class="total_price" style="float: left; margin-top: 10px; font-size: 36px;">
                $0
            </div>

            <div class="buttons-div" style="display: inline-block; float: right;">
                <asp:Button CssClass="my-button pad-more" ID="btn_checkout" runat="server" Text="Checkout" ForeColor="#999999" CausesValidation="False" OnClick="btn_checkout_Click" />
                <asp:Button CssClass="my-button pad-more" OnClick="btn_empty_Click" ID="btn_empty" runat="server" Text="Empty" ForeColor="#999999" CausesValidation="False" />
                <asp:Button CssClass="my-button pad-more" ID="btn_continue" runat="server" OnClick="btn_continue_Click" Text="Continue" ForeColor="#999999" CausesValidation="False" />

            </div>



        </div>

        <p class="message" runat="server" id="CartEmpty">
            Cart is Empty!
        </p>

    </div>

     
</asp:Content>
