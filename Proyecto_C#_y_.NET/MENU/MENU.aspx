<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MENU.aspx.cs" Inherits="Proyecto_C__y_.NET.MENU" %>

  <!doctype html>

  <html xmlns="http://www.w3.org/1999/xhtml">

  <head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sistema de Reparaciones</title>
    <link rel="stylesheet" href="/CSS/main.css" />
    <link rel="stylesheet" href="/CSS/layout.css" />
    <link rel="stylesheet" href="/CSS/forms.css" />
    <link rel="stylesheet" href="/CSS/tables.css" />
  </head>

  <body>
    <form id="form1" runat="server">
      <header>
        <h1>Bienvenido al Menú de Navegación</h1>
      </header>

      <h1 class="titulo">Sistema de Reparaciones</h1>

      <div class="menu">
        <a href="/TABLAS/Usuarios.aspx" class="card">
  <img src="/IMAGENES/USUARIOS.jpg" style="width:273px; height:200px" />
  <p>Usuarios</p>
</a>

<a href="/TABLAS/EQUIPOS.aspx" class="card">
  <img src="/IMAGENES/EQUIPOS.jpg" style="width:200px; height:200px" />
  <p>Equipos</p>
</a>

<a href="/TABLAS/Tecnicos.aspx" class="card">
  <img src="/IMAGENES/TECNICOS.jpg" style="width:200px; height:200px" />
  <p>Técnicos</p>
</a>

<a href="/TABLAS/Asignaciones.aspx" class="card">
  <img src="/IMAGENES/ASIGNACIONES.jpg" style="width:200px; height:200px" />
  <p>Asignaciones</p>
</a>

<a href="/TABLAS/Reparaciones.aspx" class="card">
  <img src="/IMAGENES/REPARACIONES.jpg" style="width:200px; height:200px" />
  <p>Reparaciones</p>
</a>

<a href="/TABLAS/DetallesReparacion.aspx" class="card">
  <img src="/IMAGENES/DETALLESREPARACION.jpg" style="width:200px; height:200px" />
  <p>Detalles de Reparación</p>
</a>
      </div>
    </form>
  </body>

  </html>