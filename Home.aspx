<%@ Page MasterPageFile="~/GameAddict.Master" Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="index" %>

<asp:Content ID="HomeContentHead" ContentPlaceHolderID="GameAddictHead" runat="server">

    <title>Home </title>
    <style>

        .rating li > span{
            font-size: 14px;
            color: #e0be00;
        }
    </style>
    
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
                  
                      
                        
                        
                


                      <ItemTemplate>
                                      
                              
                  <li class="fragment">
                    <div class="image"> 
                        <img src="Images/Game/<%# Eval("Image") %>" alt="" height="287" width="638" /> 


                    </div>
                    <div class="cnt">
                      <div class="cl">&nbsp;</div>
                      <div class="side-a">
                        <h4><a >' style="color:black;"><%# Eval("Name") %></a></h4>
                        
                      </div>
                      <div class="side-b">
                                 <p><%# Eval("details") %></p>
                      </div>
                      <div class="cl">&nbsp;</div>
                    </div>
                  </li>

                      </ItemTemplate>


                    

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
            <div class="head-cnt">  <a >view all</a>   
              <h3>Genre</h3>
              <div class="cl">&nbsp;</div>
            </div>
          </div>


          <div class="col-articles articles">
            <div class="cl">&nbsp;</div>

             

              


            <div class="cl">&nbsp;</div>
          </div>


        </div>
      </div>


      <div class="block">
        <div class="block-bot">
          <div class="head">
            <div class="head-cnt"> <a >view all</a>
              <h3>All Games</h3>
              <div class="cl">&nbsp;</div>
            </div>
          </div>
          <div class="row-articles articles">

            <div class="cl">&nbsp;</div>

              
              

            <div class="cl">&nbsp;</div>
          </div>
        </div>
      </div>
    </div>
    <!-- / Content -->
    <!--  -->
  

</asp:Content>