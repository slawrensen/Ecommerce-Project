﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rifles.aspx.cs" Inherits="Ecommerce_Project.Rifles" %>

<asp:Content ID="Rifles" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/rm.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
    <div>
        <%-- Define repeater to display all handguns --%>
        <asp:Repeater ID="Repeater1" runat="server"
            DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <h3>Rifles</h3>
            </HeaderTemplate>

            <ItemTemplate>
                <div class="col-md-3 prod" style="padding-left: 0px; padding-right: 0px;">
                    <div class="thumbnail">
                        <a href="Product.aspx?ProductID=<%# Eval("ProductId") %>" id='<%# Eval("ProductId") %>1'>
                            <img src='<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>.jpg' alt="" style="width: 100%; border: 1px solid gray;" />
                            <div class="caption">
                                <div class="prod-caption ellipsis">
                                    <asp:Label runat="server" ID="Label2"
                                        Text='<%# Eval("ProductName") %>' />
                                    <asp:Label runat="server" ID="Label3"
                                        Text='<%# Eval("ProductType") %>' />
                                </div>
                            </div>
                        </a>
                        <div>
                            <strong class="price">
                                <asp:Label runat="server" ID="Label4" class="padd1 h3"
                                    Text='<%# Eval("ProductPrice") %> ' />
                            </strong>
                            <%-- This link is incredibly important!
                                 When the user clicks on the button "Buy Now", it redirects to AddToCart.aspx with the 
                                 id of the product, and then the codebehind will add it to the orders table. --%>
                            <a href="AddToCart.aspx?ProductID=<%# Eval("ProductId") %>" class="btn btn-primary" role="button" id='<%# Eval("ProductId") %>'>Add to Cart</a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <%-- Define sql data source and the query --%>
        <asp:SqlDataSource
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            ID="SqlDataSource1" runat="server"
            SelectCommand="SELECT [ProductID], [ProductName], [ProductPrice], [ProductType],
              [ProductImage] FROM [Products] WHERE ProductType = 'Rifle'"></asp:SqlDataSource>
    </div>
</asp:Content>
