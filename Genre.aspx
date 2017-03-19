<%@  Page  MasterPageFile="~/GameAddict.Master"  Language="C#" AutoEventWireup="true" CodeFile="Genre.aspx.cs" Inherits="Genre" %>

<asp:Content ID="HomeContentHead" ContentPlaceHolderID="GameAddictHead" runat="server">
    <script>

        $(document).ready(function () {


            $(".nav-ul li").each(function () {
                $(this).removeClass("active first-active");
            });

            $('#genre').addClass("active");

        });
    </script>

</asp:Content>

<asp:Content ID="HomeContentBody" ContentPlaceHolderID="GameAddictBody" runat="server">

    <div id="content">

        <div class="block">

        <div class="block-bot">
          <div class="head">
            <div class="head-cnt"> 
              <h3>Genre</h3>
              <div class="cl">&nbsp;</div>
            </div>
          </div>
        
            <asp:SqlDataSource ID="genre" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT * FROM [Genre]"></asp:SqlDataSource>
     

          <div class="col-articles articles">
            <div class="cl">&nbsp;</div>

              <asp:Repeater ID="rp_1" runat="server" DataSourceID="genre">
                  <ItemTemplate>
                     <div class="article">
                        <div class="image"> <a href='GameGenre.aspx?gg_id=<%# Eval(" GenreID") %>&Name=<%# Eval(" Name") %>'>
                            <img src='Images/Genre/<%# Eval("Image") %>' alt="" /></a> </div>
                        <h4><a href='GameGenre.aspx?gg_id=<%#Eval("GenreID") %>'><%# Eval("Name") %></a></h4>
                     </div>
                   </ItemTemplate>
           </asp:Repeater>

            <div class="cl">&nbsp;</div>
          </div>
        </div>

      </div>
      

    </div>
   


</asp:Content>
