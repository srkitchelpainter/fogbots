<%@ Page Title="Register " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<%-- When AutoEventWireUp is true event handlers do not need bound to a page event --%>

<%-- 

TITLE: Register.aspx

AUTHOR: Shannon Painter

PURPOSE: Fogbots User Registration Page

ORIGINALLY CREATED ON: 26 July 2017

LAST MODIFIED ON: 

LAST MODIFIED BY: 

MODIFICATION HISTORY: 

    --%>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <%-- CSS Classes located in bootstrap.css file --%>

    <br /><br /><br />

<h2><%: Title %></h2>

    <%-- Header updates with Title named in Page directive --%>


    <p class="text-danger">

        <asp:Label ID="Label1" runat="server"></asp:Label>  <%-- Displays confirmation of registration submission to database.

        <asp:Literal runat="server" ID="ErrorMessage" />   Displays error message related to page--%>

        

    </p>

    

    <div class="form-horizontal">

        <h4>Create a new account.</h4>

        <hr />

      <%-- hr tag defines a thematic break in an HTML page (e.g. a shift of topic) used to separate content--%>



        <asp:ValidationSummary runat="server" CssClass="text-danger" />

             <%--  Displays error messages defined in RequiredFieldValidator--%>


  <%--Email address is used to create user name--%>

        <div class="form-group">

            <asp:Label runat="server" AssociatedControlID="email" CssClass="col-md-2 control-label">Email Address</asp:Label> 

            <div class="col-md-10">

                <asp:TextBox runat="server" ID="email" CssClass="form-control" />

                <asp:RequiredFieldValidator runat="server" ControlToValidate="email"

                    CssClass="text-danger" ErrorMessage="Email address field is required in order to create an account." />

             <%-- Email must be in valid format --%>

                <asp:RegularExpressionValidator runat="server" ID="validEmail" ControlToValidate="email" validationExpression=".*@.{2,}\..{2,}"

							CssClass="text-danger" ErrorMessage="Email address is not a valid format">

    				</asp:RegularExpressionValidator>



                <p>Email address will be your user name.</p>



            </div>

        </div>



        <%-- Create Password --%>

        <div class="form-group">

            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>

            <div class="col-md-10">

                <asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="form-control" />

                <asp:RequiredFieldValidator runat="server" ControlToValidate="password"

                    CssClass="text-danger" ErrorMessage="Password is required." />

                <%--Password must contain: Minimum 8 characters at least 1 Alpha and 1 Number--%>

                <asp:RegularExpressionValidator runat="server" ID="validPassword" ControlToValidate="password" validationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"

							CssClass="text-danger" ErrorMessage="Password must contain a minimum of 8 characters, at least 1 letter and 1 number.">

    				</asp:RegularExpressionValidator>

                       <p>Password must contain a minimum of 8 characters, at least 1 letter and 1 number.</p>

          </div>

        </div>



        <%-- Confirm Password --%>

        <div class="form-group">

            <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 control-label">Confirm Password</asp:Label>

            <div class="col-md-10">

                <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" CssClass="form-control" />

                <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"

                    CssClass="text-danger" ErrorMessage="Must confirm password." />

                <asp:CompareValidator runat="server" ControlToCompare="password" ControlToValidate="ConfirmPassword"

                    CssClass="text-danger" ErrorMessage="Passwords do not match." />

            </div>


			 <%-- Submit registration data --%>

            <div class="form-group">

             <div class="col-md-offset-2 col-md-10">

            <asp:Button ID="regButton" runat="server" Datasource="SqlDataSource" Text="Submit" CssClass="btn btn-default" OnClick="CreateUser_Click" />

                                  </div>

            </div>

        </div>

        </div>

</asp:Content>
