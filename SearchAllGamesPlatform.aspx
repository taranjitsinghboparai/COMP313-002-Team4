<%@ Page MasterPageFile="~/GameAddict.Master" Language="C#" AutoEventWireup="true" CodeFile="SearchAllGamesPlatform.aspx.cs" Inherits="SearchAllGamesPlatform" %>

<asp:Content ID="HomeContentHead" ContentPlaceHolderID="GameAddictHead" runat="server">
    
                <style>
                      .buttons-div{
                          display:block;
                          margin: 100px 10px 10px 0px;
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
                          margin: 2px;
                          margin-bottom: 10px;
                      }
                        .value{
                          display: inline-block;
                          width: 10%;
                         margin-bottom: 10px;
                       }    
                    
                  </style>

     <script>
   

    </script>

</asp:Content>

<asp:Content ID="HomeContentBody" ContentPlaceHolderID="GameAddictBody" runat="server">

    <div id="content">
       <div class="block">
        <div class="block-bot">
          <div class="head">
            <div class="filter" style="padding:10px;"   > 
              
              <h3 ><%= platform %> Games</h3>
              <div class="cl">&nbsp;</div>
            </div>
          </div>
            <asp:SqlDataSource ID="GetPID" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT [PlatformID] FROM [Platform] WHERE ([Name] = @Name)">
                <SelectParameters>
                    <asp:SessionParameter SessionField="platform" Name="Name" Type="String"></asp:SessionParameter>
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:DataList ID="IDBOX" runat="server" DataKeyField="PlatformID" DataSourceID="GetPID">

                <ItemTemplate>
                    <div style="display:none;"><%# Session["temp_platform"] = Eval("PlatformID") %></div>
                </ItemTemplate>
            </asp:DataList>
            
           
            
            <asp:SqlDataSource ID="PlatformGames" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT Game.GameID, Game.Name, Game.Details, Game.Image, Game.DateAdded, Game.ReleasedDate, Game.Rating, Game.Review, Game.isActive, GamePlatform.GamePlatformID, GamePlatform.GameID AS Expr1, GamePlatform.PlatformID, GamePlatform.Image AS Expr2, GamePlatform.DVDPrice, GamePlatform.IsActive AS Expr3 FROM Game INNER JOIN GamePlatform ON GamePlatform.GameID = Game.GameID WHERE (GamePlatform.PlatformID = @PlatfromID) AND (Game.Name LIKE '%' + @name + '%')">
                <SelectParameters>
                    <asp:SessionParameter SessionField="temp_platform" Name="PlatfromID"></asp:SessionParameter>
                    <asp:SessionParameter SessionField="search" Name="name"></asp:SessionParameter>
                </SelectParameters>
            </asp:SqlDataSource>

       <div class="row-articles articles">


            <asp:Repeater ID="GamesPlatform" OnItemCommand="GamesPlatform_ItemCommand" runat="server" DataSourceID="PlatformGames">

                <ItemTemplate>

                      <asp:TextBox ID="tb_IDBox" Visible="false" Text='<%# Eval("GameID") %>' runat="server"></asp:TextBox>
                           <div class="article last-article">
                    
                    
                    
                    <div class="cl">&nbsp;</div>
                           <div class="image"><a href="#">
                            <img src='Images/Game/<%# Eval("Image") %>' alt="" /></a> 
                           </div>
                           <div class="cnt" style="margin-left: 10px;">
                               <h4><a href="#"><%# Eval("Name") %></a></h4>

                               <div style="display: inline-block; float: right;">
                                   <asp:SqlDataSource ID="SqlDataSourceGamePlatform" runat="server" ConnectionString="<%$ ConnectionStrings:GameAddictConnectionString %>" SelectCommand="SELECT * FROM [GamePlatform] JOIN [Platform] ON [Platform].PlatformID = [GamePlatform].PlatformID WHERE ([GameID] = @GameID AND [GamePlatform].PlatformID = @PlatformID AND GamePlatform.[IsActive] = 1)">
                                       <SelectParameters>
                                           <asp:ControlParameter ControlID="tb_IDBox" PropertyName="Text" DefaultValue="1" Name="GameID" Type="Int32"></asp:ControlParameter>

                                           <asp:SessionParameter SessionField="temp_platform" DefaultValue="" Name="PlatformID"></asp:SessionParameter>
                                       </SelectParameters>
                                   </asp:SqlDataSource>
                                   
                                    <asp:DataList ID="price_list" runat="server" DataSourceID="SqlDataSourceGamePlatform" DataKeyField="GamePlatformID">
                                           <ItemTemplate>
                                                  <table>
                                                   <tr> 
                                                       <td style="width:30px;"><%# Eval("Name") %></td> 
                                                       <td style="width:10px;">:</td> 
                                                       <td style="width:40px;">$<%# Eval("DVDPrice") %></td>
                                                   
                                                   </tr>
                                               </table>

                                           </ItemTemplate>
                                   </asp:DataList>

                               </div>
                             
                               <div class="rating" style="margin: 10px 10px 10px 0px;">
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

                                  
                                   <asp:SqlDataSource ID="SqlDataSourcePrice" runat="server" ConnectionString="<%$ ConnectionStrings:GameAddictConnectionString %>" SelectCommand="SELECT Game.GameID, Game.Name, Game.Details, Game.Image, Game.DateAdded, Game.ReleasedDate, Game.Rating, Game.Review, Game.isActive, GamePlatform.GamePlatformID, GamePlatform.GameID AS Expr1, GamePlatform.PlatformID, GamePlatform.Image AS Expr2, GamePlatform.DVDPrice, GamePlatform.IsActive AS Expr3 FROM Game INNER JOIN GamePlatform ON Game.GameID = GamePlatform.GameID WHERE (Game.GameID = @GameID) AND (GamePlatform.PlatformID = @PlatformID) AND (Game.isActive = 1)">
                                       <SelectParameters>
                                           <asp:ControlParameter ControlID="tb_IDBox" PropertyName="Text" Name="GameID"></asp:ControlParameter>
                                           <asp:SessionParameter SessionField="temp_platform" Name="PlatformID"></asp:SessionParameter>

                                       </SelectParameters>
                                    </asp:SqlDataSource>

                    
                               </div>
                                <div>
                                   Release Date : &nbsp;
                                   <%# Eval("ReleasedDate", "{0:d}")%>
                               </div>
                         


                               <div class="buttons-div">
                                   <asp:Button CssClass="my-button" ID="btn_details" runat="server"  Text="View Details" CommandArgument='<%# Eval("GameID") %>' CommandName="detail" ForeColor="#999999" CausesValidation="False" />
                                   <asp:Button CssClass="my-button" ID="btn_wish" runat="server" Text="Add To WishList" CommandArgument='<%# Eval("GameID") %>' CommandName="wish" ForeColor="#999999" CausesValidation="False" />
                                   <asp:Button CssClass="my-button" ID="btn_cart" runat="server" Text="Add To Cart" CommandArgument='<%# Eval("GamePlatformID") %>' CommandName="cart" ForeColor="#999999" />


                               </div>


                           </div>


                         <div class="cl">&nbsp;</div>
   
              
                        </div>

                    <div class ="divider"></div>

                      <br />
                      <br />
                </ItemTemplate>

            </asp:Repeater>
                          </div>
                         <div class="cl">&nbsp;</div>  
          <div class="row-articles articles">
            <div class="cl">&nbsp;</div>
        
       

            <div class="cl">&nbsp;</div>
          </div>

        </div>
      </div>
        </div>

     
</asp:Content>