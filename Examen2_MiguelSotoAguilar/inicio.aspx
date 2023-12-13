<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="Examen2_MiguelSotoAguilar.inicio1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <h1>Inicio</h1>
        <br />
        <br />
        Bienvenido usuario:
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    <div class="buscarInicio">

        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Codigo"></asp:Label>
        <br />
        <br />

        <asp:TextBox ID="txt_codigo" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Correo"></asp:Label>
        <br />
        <br />

        <asp:TextBox ID="txt_correo" runat="server"></asp:TextBox>
        <br />
        <br />

        <asp:Button ID="Button1" runat="server" Text="Consultar" OnClick="Button1_Click" />
    </div>
    <div>


    </div>
</asp:Content>
