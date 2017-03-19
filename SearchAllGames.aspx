﻿<%@ Page MasterPageFile="~/GameAddict.Master" Language="C#" AutoEventWireup="true" CodeFile="SearchAllGames.aspx.cs" Inherits="SearchAllGames" %>
<%@ Import Namespace="System.Data.SqlClient" %>
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
        $(document).ready(function () {

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
            <div class="filter" style="padding:10px;"   > 
              
              <h3 >All Games</h3>
              <div class="cl">&nbsp;</div>
            </div>
          </div>
          <div class="row-articles articles">
            <div class="cl">&nbsp;</div>

              <asp:SqlDataSource ID="SqlDataSourceAllGames" runat="server" ConnectionString="<%$ ConnectionStrings:GameAddictConnectionString %>" SelectCommand="SELECT GameID, Name, Details, Image, DateAdded, ReleasedDate, Rating, Review, isActive FROM Game WHERE (isActive = 1) AND (Name LIKE '%' + @Name + '%')">
                  <SelectParameters>
                      <asp:SessionParameter SessionField="search" Name="Name"></asp:SessionParameter>
                  </SelectParameters>
              </asp:SqlDataSource>
              
               <asp:Repeater ID="all_games_search" runat="server"  DataSourceID="SqlDataSourceAllGames" OnItemCommand="all_games_ItemCommand">
                  <ItemTemplate>
                      <asp:Literal runat="server" ID="GameID" Visible="false" Text='<%# id = (int)Eval("GameID") %>'></asp:Literal>
                      <asp:TextBox ID="tb_IDBox" Visible="false" Text='<%# Eval("GameID") %>' runat="server"></asp:TextBox>
                       <div  class="article last-article">
                           <div class="cl">&nbsp;</div>
                           <div class="image"><a href="#">
                              <img src='Images/Game/<%# Eval("Image") %>' alt="" /></a> </div>
                           <div class="cnt" style="margin-left: 10px;">
                               <h4 style="display: inline-block;"><a href="#"><%# Eval("Name") %></a></h4>

                               <div style="display: inline-block; float: right;">
                                   <asp:SqlDataSource ID="SqlDataSourceGamePlatform" runat="server" ConnectionString="<%$ ConnectionStrings:GameAddictConnectionString %>" SelectCommand="SELECT * FROM [GamePlatform] JOIN [Platform] ON [Platform].PlatformID = [GamePlatform].PlatformID WHERE ([GameID] = @GameID AND GamePlatform.[IsActive] = 1)">
                                       <SelectParameters>
                                           <asp:ControlParameter ControlID="tb_IDBox" PropertyName="Text" DefaultValue="1" Name="GameID" Type="Int32"></asp:ControlParameter>
                                           
                                        </SelectParameters>
                                   </asp:SqlDataSource>
                                   
                                    <asp:DataList ID="price_list" OnItemCommand="price_list_ItemCommand" runat="server" DataSourceID="SqlDataSourceGamePlatform" DataKeyField="GamePlatformID">
                                           <ItemTemplate>

                                               
                                                <table>
                                                   <tr> 
                                                       <td style="width:60px;"><%# Eval("Name") %> &nbsp;</td> 
                                                       <td style="width:60px;">$<%# Eval("DVDPrice") %></td>
                                                      
                                                   </tr>
                                               </table>
                                                                                             
                                           </ItemTemplate>
                                   </asp:DataList>

                               </div>
                             
                               <div class="rating" style="margin: 10px 10px 10px 0px;">
                                    <div class="stars" style="display: inline-block;">
                                        <span></span>
                                  
                                   </div>



                                   <div style="display: inline-block; margin-left: 10px;">
                                       <span>
                                          
                                           <span </span></span>
                                   </div>
                               </div>

                                 <div>
                                   Release Date : &nbsp;
                                   <%# Eval("ReleasedDate", "{0:d}")%>
                               </div>

                               <div class="buttons-div">
                                   <asp:Button CssClass="my-button" ID="btn_details" runat="server"  Text="View Details" CommandArgument='<%# Eval("GameID") %>' CommandName="detail" ForeColor="#999999" CausesValidation="False" />
                                   
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