<%@ Page MasterPageFile="~/GameAddict.Master" Language="C#" AutoEventWireup="true" CodeFile="Reviews.aspx.cs" Inherits="UserPages_Reviews" %>



<asp:Content ID="HomeContentHead" ContentPlaceHolderID="GameAddictHead" runat="server">
    
                <style>
                      .buttons-div{
                          display:block;
                          margin: 25px 10px 10px 0px;
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
                      .rate-box{
                          width: 100%;
                      }
                      .label{
                          display:inline-block;
                          width: 20%;
                          margin-bottom: 10px;
                          vertical-align: middle;
                      }
                      .rating-field{
                          display:inline-block;
                          width: 70%;
                          margin-bottom:10px;
                          vertical-align: middle;
                      }
                  </style>

</asp:Content>

<asp:Content ID="HomeContentBody" ContentPlaceHolderID="GameAddictBody" runat="server">


    <div id="content">
       <div class="block">
        <div class="block-bot">
          <div class="head">
            <div class="filter" style="padding:10px;"   > 
               
              <h3 >My Reviews</h3>
              <div class="cl">&nbsp;</div>
            </div>
          </div>


            <asp:SqlDataSource ID="review" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT Review.ReviewID, Review.GameID, Game.Review, Game.Image, Review.Rating, Game.Name, Review.Review AS gameReview, Game.Image AS Expr4 FROM Review INNER JOIN Game ON Game.GameID = Review.GameID WHERE (Review.UserID = @UserID)">
                <SelectParameters>
                    <asp:SessionParameter SessionField="userid" Name="UserID"></asp:SessionParameter>
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:DataList ID="ddl_rev" OnItemCommand="ddl_rev_ItemCommand" runat="server" DataKeyField="ReviewID" DataSourceID="review">
                <ItemTemplate>
                    <div class="row-articles articles">
                        <div class="cl">&nbsp;</div>



                        <div class="article last-article">
                            <div class="cl">&nbsp;</div>
                            <div class="image"><a href="#">
                                <img src='Images/Game/<%# Eval("Image") %>' alt="" /></a> </div>
                            <div class="cnt" style="margin-left: 10px;">
                                <h4 style="display: inline-block;"><a href="#"><%# Eval("Name") %></a></h4>

                                <div class="rating" style="margin: 10px 10px 10px 0px;">
                                    <div class="stars" style="display: inline-block;">

                                        <%# Eval("Rating") %>

                                        <span class="star-rating fa fa-star"></span>
                                      

                                    </div>
                                    <div style="display: inline-block; margin-left: 10px;">
                                        <span><%# Eval("Review") %> <span class="fa fa-comment"></span></span>
                                    </div>

                                
                                </div>
                                    <div style="display: inline-block; margin-left: 0px;">
                                        <span><%# Eval("gameReview") %> </span>
                                    </div>

                                <div class="buttons-div">

                                    <asp:Button CssClass="my-button" ID="add_cart" runat="server" Text="Add To Cart" ForeColor="#999999" CausesValidation="False" />
                                    <asp:Button CssClass="my-button" ID="details" runat="server" CommandArgument='<%# Eval("GameID") %>' CommandName="gid" Text="View Details" ForeColor="#999999" CausesValidation="False" />                                    

                                </div>


                            </div>
                            <div class="cl">&nbsp;</div>
                        </div>

                        <div class="cl">&nbsp;</div>
                    </div>
                    <div class="divider"></div>
                    <br />
                </ItemTemplate>
            </asp:DataList>

          



        </div>
      </div>
        </div>

</asp:Content>