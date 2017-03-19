<%@ Page MasterPageFile="~/GameAddict.Master" Language="C#" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="GameDetails" %>

<asp:Content ID="HomeContentHead" ContentPlaceHolderID="GameAddictHead" runat="server">
    
                <style>
                      .buttons-div{
                          display:block;
                          margin: 25px 10px 10px 0px;
                      }
                      .my-button{
                           float: right;
                           display: inline-block;
                           padding: 8px;
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
                      .image img{
                          height: 250px;
                      }
                      .image-displayer{
                          padding: 10px;
                          overflow: hidden;
                          display:block;
                          width: 500%;     
                          position: relative;         
                      }
                      .game-image{
                          padding: 2px;
                          background-color: #383838;
                           box-shadow: 1px 1px 1px #272727;
                           display: inline-block;
                           margin: 0 2px 4px 0;
                      }
                      .game-image, .game-image img{
                          height: 200px;
                          width: 200px;
                      }
                      .displayer-body{
                          margin: 10px 10px 10px 0;
                          box-shadow: 1px 1px 1px #1a1a1a;
                          background-color: #1a1a1a;
                          overflow: hidden;
                          position: relative;
                          padding: 10px;
                      }
                  .left-button{
                     width: 20px; background-color: rgba(0,0,0,0.7); height: 250px; position: absolute; top: 0%; left: 0px;
                      color: #808080; font-size: 14px;
                      opacity: 0.3;
                  }
                  .right-button{
                     width: 20px; background-color: rgba(0,0,0,0.7); height: 250px; position: absolute; top: 0%; left: 97%;
                     color: #808080; font-size: 14px;
                      opacity: 0.3;
                  }
                  .left-button:hover, .right-button:hover{
                      opacity: 1;
                  }
                  .cnt{
                      position: relative;
                  }
                    .auto-style1 {
                        width: 100%;
                    }
                    .auto-style2 {
                        width: 59px;
                    }
                    .auto-style3 {
                        width: 1px;
                    }

                    .auto-style1 tr td{
                         padding: 4px;
                   }

                    .pad-me{
                        padding: 6px;
                    }

         .none{
             float: none;
         }

         .r_div{
             background-color: #1a1a1a;
             padding: 8px;
             border-radius: 6px;
             opacity: 0.6;
         }
                  </style>

    <script>
        $(document).ready(function () {
            var left = 0;
            var right = 0;
            var movement = 0;
            var movementRight = 0;

            $('.right-button').click(function () {
           
                if ($('.game-image:last').offset().left > 900) {

                    left = 100;
                    movement -= left;
                    $('.image-displayer').animate({ marginLeft: movement + 'px' }, "slow");
                    //console.log($('.image-displayer').offset())
                }

            });

            $('.left-button').click(function () {
           
                if ($('.game-image:first').offset().left <= 440) {

                    right = 100;
                    movementRight += right;
                    $('.image-displayer').animate({ left: movementRight + 'px' }, "slow");
                    //console.log($('.image-displayer').offset())
                }
            });
        });
    </script>

</asp:Content>

<asp:Content ID="HomeContentBody" ContentPlaceHolderID="GameAddictBody" runat="server">


    <div id="content">
       <div class="block">
        <div class="block-bot">
          <div class="head">
            <div class="filter" style="padding:10px;"   > 
        
              <h3 >Game Details</h3>
              <div class="cl">&nbsp;</div>
            </div>
          </div>

          <div class="row-articles articles">
            <div class="cl">&nbsp;</div>

            <div class="article last-article">
              <div class="cl">&nbsp;</div>
              <div class="image">
                   <a href="#"><img src="Images/Game/<%=image%>" /></a>
              </div>
              <div class="cnt">
                <h4 style="display:inline-block;"><a href="#"><%= g_name %></a></h4>

                
                  <div  >
                      
                      
                  </div>

                  <asp:SqlDataSource ID="gps" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT Platform.Name FROM Platform INNER JOIN GamePlatform ON Platform.PlatformID = GamePlatform.PlatformID WHERE (GamePlatform.GameID = @GameID)">
                      <SelectParameters>
                          <asp:QueryStringParameter QueryStringField="gid" Name="GameID"></asp:QueryStringParameter>
                      </SelectParameters>
                  </asp:SqlDataSource>
                  
                   <div style="margin: 10px 10px 10px 0;">
                     <span>Available for :</span>
                       
                       <asp:Repeater ID="rptr" runat="server" DataSourceID="gps">
                           <ItemTemplate>
                               <span> <%# Eval("Name") %> </span> 
                               <span> &nbsp; </span> 
                           </ItemTemplate>
                       </asp:Repeater>
                       
                 
                   
                   </div> 
                        <p>
                            <%=g_details %>
                        </p>
              
         </div>

                   <asp:SqlDataSource ID="SqlDataSourceGamePlatform" runat="server" ConnectionString="<%$ ConnectionStrings:GameAddictConnectionString %>" SelectCommand="SELECT * FROM [GamePlatform] JOIN [Platform] ON [Platform].PlatformID = [GamePlatform].PlatformID WHERE ([GameID] = @GameID AND GamePlatform.[IsActive] = 1)">
                       <SelectParameters>
                           <asp:QueryStringParameter QueryStringField="gid" Name="GameID"></asp:QueryStringParameter>
                       </SelectParameters>
                       <SelectParameters>                                           
                                        </SelectParameters>
                                   </asp:SqlDataSource>

                     <asp:DataList ID="price_list" OnItemCommand="price_list_ItemCommand" runat="server" DataSourceID="SqlDataSourceGamePlatform" DataKeyField="GamePlatformID">
                                           <ItemTemplate>
                                           
                                               <table style="margin-left: 10px;">
                                                   <tr> 
                                                       <td style="width:60px;"><%# Eval("Name") %> &nbsp;</td> 
                                                       <td style="width:60px;">$<%# Eval("DVDPrice") %></td>
                                                       
                                                   </tr>
                                               </table>

                                           </ItemTemplate>
                                   </asp:DataList>
              
              <div class="cl">&nbsp;</div>


            </div>

         <div class="cl">&nbsp;</div>


               <div class="displayer-body">

                      <div class="image-displayer">
                          
                          <asp:SqlDataSource ID="gg_image" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT Game.Name, GameImage.Image FROM GameImage INNER JOIN Game ON Game.GameID = GameImage.GameID WHERE (GameImage.GameID = @GameID)">
                              <SelectParameters>
                                  <asp:QueryStringParameter QueryStringField="gid" Name="GameID"></asp:QueryStringParameter>
                              </SelectParameters>
                          </asp:SqlDataSource>
                          <asp:Repeater ID="r1" runat="server" DataSourceID="gg_image">
                              <ItemTemplate>

                                  <div class="game-image">
                                      <img src='Images/<%#Eval("Name").ToString().Trim()%>/Game Play/<%#Eval("Image")%>' />
                                  </div>

                              </ItemTemplate>
                          </asp:Repeater>
                      </div>

                      <div class="left-button" style="text-align: center">
                          <span style="top: 45%; position: relative;" class="fa fa-arrow-left"></span>
                      </div>
                      <div class="right-button" style="text-align: center">
                          <span style="top: 45%; position: relative;" class="fa fa-arrow-right"></span>
                      </div>
                  </div>
          </div>
 </div>

            <br />
            <br />


        </div>
      </div>
    
</asp:Content>
