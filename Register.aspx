<%@ Page MasterPageFile="~/GameAddict.Master"  Language="C#" AutoEventWireup="true" CodeFile="~/Register.aspx.cs" Inherits="Register" %>


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

<asp:Content ID="RegisterBodyContentBody" ContentPlaceHolderID="GameAddictBody" runat="server">

    <div>
        <h1>Register Now</h1>
        <asp:Table ID="Table1" runat="server" CellPadding="5" CellSpacing="10">
            <asp:TableRow>
                <asp:TableCell>First Name :</asp:TableCell>
                <asp:TableCell>
                    <br />

                    <asp:TextBox ID="txt_firstName" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="txtFirstName" runat="server"
                        ErrorMessage="You must Enter your First Name."
                        ControlToValidate="txt_firstName" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator><br />
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>E-mail :</asp:TableCell>
                <asp:TableCell>
                                        <br />

                    <asp:TextBox ID="txt_Email" runat="server"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ErrorMessage=" Enter proper E-mail address" ForeColor="Red"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="txt_Email"></asp:RegularExpressionValidator><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
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
                    <asp:RequiredFieldValidator ForeColor="Red" ID="rv1" runat="server" ErrorMessage="Password Field is required" ControlToValidate="txt_pass"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="pas1" runat="server" Display="Dynamic"
                        ControlToValidate="txt_pass"
                        ErrorMessage="Password must contain one of @#$%^&*/."
                        ValidationExpression=".*[@#$%^&*/].*" ForeColor="Red" /><br />
                    <asp:RegularExpressionValidator ID="pas2" runat="server" Display="Dynamic"
                        ControlToValidate="txt_pass"
                        ErrorMessage="Password must be 4-12 nonblank characters."
                        ValidationExpression="[^\s]{4,12}" ForeColor="Red" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl_repass" runat="server" Text="Label">Re-Password : </asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                   <br />
                    <asp:TextBox type="password" ID="txt_repass" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rv2" runat="server" ErrorMessage="Password Field is empty" ForeColor="Red" ControlToValidate="txt_repass"></asp:RequiredFieldValidator>
                   <br />
                     <asp:CompareValidator ID="passs" runat="server"
                        ControlToValidate="txt_repass"
                        ControlToCompare="txt_pass"
                        ErrorMessage="Passwords does not match." ForeColor="Red" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                     <asp:Button CssClass="my-button pad-more" ForeColor="Gray" ID="cncl" runat="server" Text="Cancel" />
                    <asp:Button CssClass="my-button pad-more" ForeColor="Gray" ID="btn_register" runat="server" Text="Register" OnClick="btn_register_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>

    <br />
    <p style="font-size: 16px;">
        <asp:Label ID="lbl_message" runat="server" ForeColor="Red" Text=""></asp:Label>
    </p>
</asp:Content>
