<%@ Page MasterPageFile="~/GameAddict.Master"  Language="C#" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="PlaceOrder" %>


<asp:Content ID="HomeContentHead" ContentPlaceHolderID="GameAddictHead" runat="server">
    
                <style>
                      .buttons-div{
                          display:block;
                          margin: 20px 10px 10px 0px;
                  
                      }
                      .my-button{
                           padding: 5px;
                           background-color: #1a1a1a;
                           border-radius: 4px;
                           margin-left: 8px;
                           border: none;
                           color: #808080;
                           width: 100px;
                           height: 40px;
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
                   
                    #sidebar{
                        display:none;
                    }
                    .outer{
                        text-align:center;
                        margin: 50px auto;
                        width: 60%;
                        border-radius: 5px;
                    }

                    .place-order{
                        background-color: #bcbdc1;
                        color: black;
                        font-size: 24px;
                        padding: 6px;
                        border-radius: 5px;
                        margin: 0 auto;
                        box-shadow: 1px 1px 1px #999a9c;
                    }
                    
               </style>

</asp:Content>

<asp:Content ID="HomeContentBody" ContentPlaceHolderID="GameAddictBody" runat="server">

    <div class="outer">
        <div class="place-order">
            Your order has been placed successfully
        </div>
    </div>

    <div class="" style="text-align:center">
        <span>
            <asp:Button ID="btn_home" PostBackUrl="~/Home.aspx" CssClass="my-button" runat="server" Text="Continue" />

        </span>
        <span>
            <asp:Button ID="btn_continue" CssClass="my-button" runat="server" Text="Orders" PostBackUrl="~/Orders.aspx"/>
        </span>
    </div>

    <br />
    <br />

</asp:Content>
