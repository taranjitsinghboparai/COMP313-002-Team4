
<%@ Page MasterPageFile="~/GameAddict.Master"  Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>


<asp:Content ID="HomeContentHead" ContentPlaceHolderID="GameAddictHead" runat="server">
    
                <style>
                      .buttons-div{
                          display:block;
                          margin: 20px 10px 10px 0px;
                  
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
                          width: 80%;
                          margin: 2px;
                          margin-bottom: 10px;
                      }
                        .value{
                          display: inline-block;
                          width: 10%;
                         margin-bottom: 10px;
                       }
                    .auto-style1 {
                        width: 100%;
                    }
                    #sidebar{
                        display:none;
                    }
                    .auto-style2 {
                        width: 73px;
                    }
                    .auto-style3 {
                        width: 153px;
                    }
                    .auto-style4 {
                        width: 17px;
                    }
               </style>

</asp:Content>

<asp:Content ID="HomeContentBody" ContentPlaceHolderID="GameAddictBody" runat="server">
            <h1>CheckOut Page</h1>
            <!--<h3>Contact Information</h3>-->

    <asp:SqlDataSource ID="UserDets" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT * FROM [UserDetails]  WHERE [UserDetails].UserID = @UserID;">
        <SelectParameters>
            <asp:SessionParameter SessionField="userid" Name="UserID"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DataList  ID="ddl1" OnItemCreated="ddl1_ItemCreated" runat="server" DataSourceID="UserDets">

        <ItemTemplate>
            <asp:Table ID="Table1" runat="server" CellPadding="5" CellSpacing="10">

                <asp:TableRow>
                    <asp:TableCell>
                        <h3>Billing Address</h3>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>

                    <asp:TableCell>Address :</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox  ID="txt_address" runat="server" Text='<%# Eval("Address") %>' TextMode="MultiLine" Rows="3" Width="170"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="Address is required."
                            ControlToValidate="txt_address" Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>&nbsp;
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>City : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txt_city" Text='<%# Eval("City") %>' runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="Please Enter your City."
                            ControlToValidate="txt_city" Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>&nbsp;
                    </asp:TableCell>
                </asp:TableRow>


                <asp:TableRow>
                    <asp:TableCell Visible="false">
                        <asp:TextBox ID="tbx_Province" Text='<%# Eval("Province").ToString().Trim()%>' runat="server"></asp:TextBox></asp:TableCell>
                    <asp:TableCell>State :</asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DDL_pro" AutoPostBack="true" OnSelectedIndexChanged="DDL_pro_SelectedIndexChanged" runat="server"  Width="170">
                  
                        </asp:DropDownList>
                       
                    </asp:TableCell>
                </asp:TableRow>


                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lbl_zip" runat="server" Text="Label">Zip-Code:</asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txt_zip" Text='<%# Eval("PostalCode") %>' runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvZip" runat="server"
                            ErrorMessage=" Enter Zip Code" ForeColor="Red"
                            ControlToValidate="txt_zip"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Telephone :</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txt_phone" Text='<%# Eval("Phone") %>' runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ErrorMessage="You must Enter your Number."
                            ControlToValidate="txt_phone" Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>&nbsp;
                    </asp:TableCell>
                </asp:TableRow>



            </asp:Table>
        </ItemTemplate>
        </asp:DataList>
            
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">&nbsp;</td>

                    <td class="auto-style2">
                        <asp:Button ID="btn_continue" runat="server" Height="30px" Text="Continue" Width="100px" OnClick="btn_continue_Click" />
                    </td>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btn_cancel" runat="server" Height="30px" Text="Cancel" Width="100px" CausesValidation="False" PostBackUrl="~/Cart.aspx" />
                    </td>
                </tr>
            </table>
    

            <p >
                <asp:Label ID="lblMessage" ForeColor="Red" runat="server"  EnableViewState="True" Visible="true" 
                    Text="" CssClass="button"></asp:Label>
            </p>
          
  </asp:content>
