<%@ Page MasterPageFile="~/GameAddict.Master" Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="index" %>

<asp:Content ID="HomeContentHead" ContentPlaceHolderID="GameAddictHead" runat="server">

    <title>Home </title>
    <style>

        .rating li > span{
            font-size: 14px;
            color: #e0be00;
        }
    </style>
    <script>
        $(document).ready(function () {


                $(".nav-ul li").each(function () {
                    $(this).removeClass("active first-active");
                });

                $('#home').addClass("active first-active");

        });
    </script>
</asp:Content>

<asp:Content ID="HomeContentBody" ContentPlaceHolderID="GameAddictBody" runat="server">

      <!-- Content -->
      <div id="content">
        <div class="block">
          <div class="block-bot">
            <div class="block-cnt">
               <div id="slider">
                <div class="buttons"> <span class="prev">prev</span> <span class="next">next</span> </div>
                <div class="holder">
                  <div class="frame">&nbsp;</div>
                  <div class="content">




                    <ul>
                  
                      
                        <asp:SqlDataSource ID="carousel_game" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT TOP (5) GameID, Name, Details, Image, DateAdded, ReleasedDate, Rating, Review, isActive FROM Game WHERE (isActive = 1) AND (ReleasedDate < GETDATE()) ORDER BY DATEADDED DESC"></asp:SqlDataSource>
                        
                <asp:Repeater ID="rpt_slider" runat="server" DataSourceID="carousel_game">


                      <ItemTemplate>
                                      
                              
                  <li class="fragment">
                    <div class="image"> 
                        <img src="Images/Game/<%# Eval("Image") %>" alt="" height="287" width="638" /> 


                    </div>
                    <div class="cnt">
                      <div class="cl">&nbsp;</div>
                      <div class="side-a">
                        <h4><a href='Details.aspx?gid=<%#Eval("GameID") %>' style="color:black;"><%# Eval("Name") %></a></h4>
                        <ul class="rating">
                           
                          <li>
                              <span> <%# Eval("Rating") %>&nbsp;<span class="fa fa-star">&nbsp;&nbsp;  </span></span>
                          </li>
                         
                         <li> 
                             <span> <%# Eval("Review") %>&nbsp;<span class="fa fa-comment">&nbsp;</span></li></span>
                        </ul>
                      </div>
                      <div class="side-b">
                                 <p><%# Eval("details") %></p>
                      </div>
                      <div class="cl">&nbsp;</div>
                    </div>
                  </li>

                      </ItemTemplate>


                  </asp:Repeater>      

                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

          <!-- Genre Start-->
      <div class="block">
        <div class="block-bot">
          <div class="head">
            <div class="head-cnt">  <a href="Genre.aspx" class="view-all">view all</a>   
              <h3>Genre</h3>
              <div class="cl">&nbsp;</div>
            </div>
          </div>


          <div class="col-articles articles">
            <div class="cl">&nbsp;</div>

              <asp:SqlDataSource ID="genre" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT TOP (3) GenreID, Name, IsActive, Image FROM Genre ORDER BY GenreID DESC"></asp:SqlDataSource>

              <asp:Repeater ID="g_repeater" runat="server" DataSourceID="genre">
            
                 <ItemTemplate> 
                    <div class="article">
                      <div class="image"> <a href='GameGenre.aspx?gg_id=<%# Eval(" GenreID") %>&Name=<%# Eval(" Name") %>'><img src='Images/Genre/<%# Eval("Image") %>' alt="" /></a> </div>
                      <h4><a href='GameGenre.aspx?gg_id=<%# Eval(" GenreID") %>&Name=<%# Eval(" Name") %>'><%# Eval("Name") %></a></h4>
                    </div>
                 </ItemTemplate>

           </asp:Repeater>


            <div class="cl">&nbsp;</div>
          </div>


        </div>
      </div>


      <div class="block">
        <div class="block-bot">
          <div class="head">
            <div class="head-cnt"> <a href="AllGames.aspx" class="view-all">view all</a>
              <h3>All Games</h3>
              <div class="cl">&nbsp;</div>
            </div>
          </div>
          <div class="row-articles articles">

            <div class="cl">&nbsp;</div>

              <asp:SqlDataSource ID="top3" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT TOP (3) GameID, Name, Details, Image, DateAdded, ReleasedDate, Rating, Review, isActive FROM Game WHERE (isActive = 1)"></asp:SqlDataSource>
              <asp:Repeater ID="game_all" runat="server" DataSourceID="top3">
                  <ItemTemplate>

                      <div class="article">

                          <div class="cl">&nbsp;</div>

                          <div class="image"><a href='Details.aspx?gid=<%# Eval("GameID") %>'>
                              <img src='Images/Game/<%# Eval("Image") %>' alt="" /></a> 

                          </div>

                          <div class="cnt">
                              <h4><a href='Details.aspx?gid=<%# Eval("GameID") %>'><%# Eval("Name") %></a></h4>
                               <p><%# Eval("Details") %></p>
                          </div>

                          <div class="cl">&nbsp;</div>
                      </div>

                  </ItemTemplate>
              </asp:Repeater>

            <div class="cl">&nbsp;</div>
          </div>
        </div>
      </div>
    </div>
    <!-- / Content -->
    <!--  -->
  

</asp:Content>