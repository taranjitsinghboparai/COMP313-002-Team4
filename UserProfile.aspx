<%@ Page MasterPageFile="~/GameAddict.Master"  Language="C#" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>


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
    <div>
        <h1>Edit Profile</h1>
        <h2>Personal Details</h2>

        <asp:SqlDataSource ID="User" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT * FROM [User] WHERE ([UserID] = @UserID)">
            <SelectParameters>
                <asp:SessionParameter SessionField="userid" Name="UserID" Type="Int32"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:DataList ID="ddl_personal" runat="server" DataSourceID="User">
            <ItemTemplate>

                <asp:Table ID="Table1" runat="server" CellPadding="5" CellSpacing="10">
                    <asp:TableRow>
                        <asp:TableCell>Name :</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txt_firstName" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtFirstName" runat="server"
                                ErrorMessage="You must Enter your First Name."
                                ControlToValidate="txt_firstName" Display="Dynamic" ForeColor="Red">
                            </asp:RequiredFieldValidator>&nbsp;
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>E-mail :</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txt_Email" Text='<%# Eval("email").ToString().Trim() %>' runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                ErrorMessage=" Enter proper E-mail address" ForeColor="Red"
                                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txt_Email"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                ErrorMessage=" Enter Email address" ForeColor="Red"
                                ControlToValidate="txt_Email"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lbl_pass" runat="server" Text="Label">Password : </asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox type="password" Text='' ID="txt_pass" runat="server"></asp:TextBox><br />
                            <asp:RegularExpressionValidator ID="RecheckPss" runat="server" Display="Dynamic"
                                ControlToValidate="txt_pass"
                                ErrorMessage="Password must contain one of @#$%^&*/."
                                ValidationExpression=".*[@#$%^&*/].*" ForeColor="Red" />
                            <asp:RegularExpressionValidator ID="RecheckPss1" runat="server" Display="Dynamic"
                                ControlToValidate="txt_pass"
                                ErrorMessage="Password must be 4-12 nonblank characters."
                                ValidationExpression="[^\s]{4,12}" ForeColor="Red" />
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lbl_repass" runat="server" Text="Label">Re-Password : </asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox type="password" Text='' ID="txt_repass" runat="server"></asp:TextBox><br />
                            <asp:CompareValidator ID="CP1" runat="server"
                                ControlToValidate="txt_repass"
                                ControlToCompare="txt_pass"
                                ErrorMessage="Passwords does not match." ForeColor="Red" />
                        </asp:TableCell></asp:TableRow></asp:Table></ItemTemplate></asp:DataList><!--<h3>Contact Information</h3>--><asp:SqlDataSource ID="UserDets" runat="server" ConnectionString='<%$ ConnectionStrings:GameAddictConnectionString %>' SelectCommand="SELECT * FROM [UserDetails]  WHERE [UserDetails].UserID = @UserID;">
        <SelectParameters>
            <asp:SessionParameter SessionField="userid" Name="UserID"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DataList  ID="ddl1" OnItemCreated="ddl1_ItemCreated" runat="server" DataSourceID="UserDets">

        <ItemTemplate>
            <asp:Table ID="Table2" runat="server" CellPadding="5" CellSpacing="10">

                <asp:TableRow>
                    <asp:TableCell>
                        <h3>Billing Address</h3>
                    </asp:TableCell></asp:TableRow><asp:TableRow>

                    <asp:TableCell>Address :</asp:TableCell><asp:TableCell>
                        <asp:TextBox  ID="txt_address" runat="server" Text='<%# Eval("Address").ToString().Trim() %>' TextMode="MultiLine" Rows="3" Width="170"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="Address is required."
                            ControlToValidate="txt_address" Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>&nbsp;
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>City : </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txt_city" Text='<%# Eval("City").ToString().Trim() %>' runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="Please Enter your City."
                            ControlToValidate="txt_city" Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>&nbsp;
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell Visible="false">
                        <asp:TextBox ID="tbx_Province" Text='<%# Eval("Province").ToString().Trim()%>' runat="server"></asp:TextBox></asp:TableCell><asp:TableCell>State :</asp:TableCell><asp:TableCell>
                        <asp:DropDownList AutoPostBack="true" ID="DDL_pro" OnSelectedIndexChanged="DDL_pro_SelectedIndexChanged" runat="server"  Width="170">
                  
                        </asp:DropDownList>
                       
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lbl_zip" runat="server" Text="Label">Zip-Code:</asp:Label>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txt_zip" Text='<%# Eval("PostalCode").ToString().Trim() %>' runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvZip" runat="server"
                            ErrorMessage=" Enter Zip Code" ForeColor="Red"
                            ControlToValidate="txt_zip"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>Telephone :</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txt_phn" Text='<%# Eval("Phone").ToString().Trim() %>' runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ErrorMessage="You must Enter your Number."
                            ControlToValidate="txt_phn" Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>&nbsp;
                    </asp:TableCell></asp:TableRow></asp:Table></ItemTemplate></asp:DataList><table class="auto-style1">
                <tr>
                    <td class="auto-style3">&nbsp;</td><td class="auto-style2">
                        <asp:Button ID="btn_Update" OnClick="btn_Update_Click" runat="server" Height="30px" Text="Update" Width="100px" />
                    </td>
                    <td class="auto-style4">
                        &nbsp;</td><td>
                        <asp:Button ID="btn_Cancel" runat="server" Height="30px" Text="Cancel" Width="100px" CausesValidation="False" PostBackUrl="~/Cart.aspx" />
                    </td>
                </tr>
            </table>
    <br />
        <p style="font-size: 16px">
            <asp:Label ID="lbl_Message" runat="server" Text=""></asp:Label></p><p style="font-size: 16px">
            <asp:Label ID="lbl_update" runat="server" Text=""></asp:Label></p></div></asp:Content>