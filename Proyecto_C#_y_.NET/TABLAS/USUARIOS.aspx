<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="USUARIOS.aspx.cs" Inherits="Proyecto_C__y_.NET.USUARIOS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Usuarios</title>
  <link rel="stylesheet" href="/CSS/main.css" />
  <link rel="stylesheet" href="/CSS/layout.css" />
  <link rel="stylesheet" href="/CSS/forms.css" />
  <link rel="stylesheet" href="/CSS/tables.css" />
</head>
<body>
  <form id="form1" runat="server">

    <header>
      <h1>Usuarios</h1>
    </header>

    <div>
      <a href="/MENU/MENU.aspx" class="btn-volver">Menú Principal</a>
    </div>

    <div>
      <asp:GridView ID="GridView1" runat="server" Height="352px" Width="483px">
      </asp:GridView>
    </div>

  </form>
</body>
</html>