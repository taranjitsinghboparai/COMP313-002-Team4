<%@ Page MasterPageFile="~/GameAddict.Master"  Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>


<asp:Content ID="LogContentHead" ContentPlaceHolderID="GameAddictHead" runat="server">
    
                <style>
                      .buttons-div{
                          display:block;
                          margin: 20px 10px 10px 0px;
                  
                      }
                      .my-button{
                           display: inline-block;
                           padding: 5px;
                           background-color: #808080;
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
                    .auto-style2 {
                        width: 83px;
                    }
                    .auto-style3 {
                        width: 64px;
                    }
                    #sidebar{
                        display:none;
                    }
               </style>

</asp:Content>

<asp:Content ID="LogContentBody" ContentPlaceHolderID="GameAddictBody" runat="server">

        
        
        <asp:Table ID="Table1" runat="server" CellPadding="5" CellSpacing="5">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl_username" runat="server" Text="Label">E-mail : </asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <br />
                  <asp:TextBox ID="txt_Email" runat="server"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage=" Enter proper E-mail address" ForeColor="Red"
                              ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                             ControlToValidate="txt_Email"></asp:RegularExpressionValidator><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage=" Enter Your Email address" ForeColor="Red"
                             ControlToValidate="txt_Email"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl_pass" runat="server" Text="Label">Password : </asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <br />
                    <asp:TextBox type="password" ID="txt_pass" runat="server"></asp:TextBox><br />
                   
                    <asp:RequiredFieldValidator ForeColor="Red" ID="dsa" runat="server" ErrorMessage="Password is required" ControlToValidate="txt_pass"></asp:RequiredFieldValidator>
                  
                </asp:TableCell>
                </asp:TableRow>

</asp:Table>                
    <asp:Button CssClass="my-button" ID="btn_Login" OnClick="btn_Login_Click" runat="server" Text="Login"  />
    <asp:Button CssClass="my-button" ID="btn_register" OnClick="btn_register_Click" runat="server" Text="Register" CausesValidation="False"/>
    
    <p style="font-size: 16px">
        <asp:Label ID="lbl_wrong_password" ForeColor="Red" runat="server" Text="Label"></asp:Label>
    </p>

</asp:Content>