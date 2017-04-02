<%@ Page MasterPageFile="~/GameAddict.Master" Language="C#" AutoEventWireup="true" CodeFile="Wishlist.aspx.cs" Inherits="Wishlist" %>


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



        <div id="content">
        <div class="block">
            
        <asp:SqlDataSource ID="wishlist" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT Wishlist.WishListID, Wishlist.GameID, Game.Name, Game.Image, Game.ReleasedDate, Game.Rating, Game.Review, Game.isActive AS g_active FROM Wishlist INNER JOIN Game ON Game.GameID = Wishlist.GameID WHERE (Wishlist.UserID = @UserID)">
            <SelectParameters>
                <asp:SessionParameter SessionField="userid" Name="UserID"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>

            <div class="block-bot">
                <div class="head">
                    <div class="filter" style="padding: 10px;">

                        <h3>My Wishlist</h3>
                        <div class="cl">&nbsp;</div>
                    </div>
                </div>


                <asp:DataList ID="ddl_list" OnItemCommand="ddl_list_ItemCommand" runat="server" DataSourceID="wishlist">
                    <ItemTemplate>

                        <asp:TextBox ID="tb_IDBox" Visible="false" Text='<%# Eval("GameID") %>' runat="server"></asp:TextBox>


                        <div class="row-articles articles">
                            <div class="cl">&nbsp;</div>

                            <div class="article last-article">
                                <div class="cl">&nbsp;</div>
                                <div class="image">
                                    <a href="#">
                                        <img src='Images/Game/<%# Eval("Image") %>' alt="" /></a>
                                </div>
                                <div class="cnt">
                                    <h4 style="display: inline-block; margin-left: 20px;"><a href="#"><%# Eval("Name") %></a></h4>


                          




                               <div class="rating" style="margin: 10px 10px 10px 20px;">
                                    <div class="stars" style="display: inline-block;">
                                       <%#DataBinder.Eval(Container.DataItem, "Rating") %> <span class="star-rating fa fa-star"></span>
                                  
                                   </div>



                                   <div style="display: inline-block; margin-left: 10px;">
                                       <span>
                                           <asp:Label ID="comment" runat="server"  Text='<%# Eval("Review") %>'></asp:Label> 
                                           <span class="fa fa-comment"></span></span>
                                   </div>
                               </div>

                                     <div class="details" style="display: inline-block; float: right;">


                                
                               </div>

                                    <div class="buttons-div" style="float: right; margin-left: 180px;">  
                                        <asp:Button ID="btn_wishlist" ForeColor="Gray"  CssClass="my-button" CommandArgument='<%# Eval("WishlistID") %>' CommandName="wid" runat="server" Text="Delete" />
                                    </div>


                                </div>
                              
                                <br />
                                <div class="divider" >&nbsp;</div>
                                <br />
                                <div class="cl">&nbsp;</div>
                            </div>

                            <div class="cl">&nbsp;</div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>




            </div>

         

            <div class="buttons-div" style="display: inline-block; float: right;">
                <asp:Button CssClass="my-button pad-more" ID="btn_empty" runat="server" OnClick="btn_empty_Click" Text="Empty" ForeColor="#999999" CausesValidation="False" />
                <asp:Button CssClass="my-button pad-more" OnClick="btn_continue_Click" ID="btn_continue" runat="server" Text="Continue" ForeColor="#999999" CausesValidation="False" />

            </div>



        </div>

        <p visible="false" class="message" style="color:red; font-size: 16px;" runat="server" id="WishListEmpty">
            Wishlist is Empty!
        </p>

    </div>


    </asp:Content>  