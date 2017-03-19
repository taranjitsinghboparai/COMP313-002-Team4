<%@ Page MasterPageFile="~/GameAddict.Master" Language="C#" AutoEventWireup="true" CodeFile="Upcomming.aspx.cs" Inherits="Upcomming" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="HomeContentHead" ContentPlaceHolderID="GameAddictHead" runat="server">
    
                <style>
                      .buttons-div{
                          display:block;
                          margin: 90px 10px 10px 0px;
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
        $(document).ready(function () {


            $(".nav-ul li").each(function () {
                $(this).removeClass("active first-active");
            });

            $('#upcomming').addClass("active");
        });

    </script>

    <script>
        function Add_To_Wishlist(id) {

            alert(id);
        }
        function GetPlatform() {
            alert("In");
        }
    </script>
   

</asp:Content>

<asp:Content ID="HomeContentBody" ContentPlaceHolderID="GameAddictBody" runat="server">
    <div runat="server" ID="testDiv"></div>
    <div id="content">
       <div class="block">
        <div class="block-bot">
          <div class="head">
            <div class="filter" style="padding:10px;"> 
              
              <h3 >All Games</h3>
              <div class="cl">&nbsp;</div>
            </div>
          </div>
          <div class="row-articles articles">
            <div class="cl">&nbsp;</div>

              <asp:SqlDataSource ID="SqlDataSourceAllGames" runat="server" ConnectionString="<%$ ConnectionStrings:GameAddictConnectionString %>" SelectCommand="SELECT GameID, Name, Details, Image, DateAdded, ReleasedDate, Rating, Review, isActive FROM Game WHERE (isActive = 1) AND (ReleasedDate > GETDATE()) ORDER BY ReleasedDate DESC"></asp:SqlDataSource>
              
               <asp:Repeater ID="all_games" runat="server"  DataSourceID="SqlDataSourceAllGames" OnItemCommand="all_games_ItemCommand">
                  <ItemTemplate>
                      <asp:Literal runat="server" ID="GameID" Visible="false" Text='<%# id = (int)Eval("GameID") %>'></asp:Literal>
                      <asp:TextBox ID="tb_IDBox" Visible="false" Text='<%# Eval("GameID") %>' runat="server"></asp:TextBox>
                       <div  class="article last-article">
                           <div class="cl">&nbsp;</div>
                           <div class="image"><a href='Details.aspx?gid=<%# Eval("GameID") %>'>
                               <img src='Images/Game/<%# Eval("Image") %>' alt="" /></a> </div>
                           <div class="cnt" style="margin-left: 10px;">
                               <h4 style="display: inline-block;"><a href="#"><%# Eval("Name") %></a></h4>

                             
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

                               <div>
                                   Release Date : &nbsp;
                                   <%# Eval("ReleasedDate", "{0:d}")%>
                               </div>

                                   
                               <div style="display: inline-block; ">
                                   Details : &nbsp;  
                                   <%# Eval("Details") %>

                               </div>

                               <div class="buttons-div">
                                   <asp:Button CssClass="my-button" ID="btn_details" runat="server"  Text="View Details" CommandArgument='<%# Eval("GameID") %>' CommandName="detail" ForeColor="#999999" CausesValidation="False" />
                                   <asp:Button CssClass="my-button" ID="btn_wish" runat="server" Text="Add To WishList" CommandArgument='<%# Eval("GameID") %>' CommandName="wish" ForeColor="#999999" CausesValidation="False" />

                               </div>


                           </div>
              <div class="cl">&nbsp;</div>
            </div>

                      <div class="divider"></div>
                      <br />
                      <br />
                         <div class="cl">&nbsp;</div>     
                  </ItemTemplate>
              </asp:Repeater>
              
            
          </div>

        </div>
      </div>
        </div>

        
 
</asp:Content>