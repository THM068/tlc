<%--
 ~  Copyright 2010-2013 Paul Fernley.
 ~
 ~  This file is part of the Three Ledger Core (TLC) software
 ~  from Paul Fernley.
 ~
 ~  TLC is free software: you can redistribute it and/or modify
 ~  it under the terms of the GNU General Public License as published by
 ~  the Free Software Foundation, either version 3 of the License, or
 ~  (at your option) any later version.
 ~
 ~  TLC is distributed in the hope that it will be useful,
 ~  but WITHOUT ANY WARRANTY; without even the implied warranty of
 ~  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 ~  GNU General Public License for more details.
 ~
 ~  You should have received a copy of the GNU General Public License
 ~  along with TLC. If not, see <http://www.gnu.org/licenses/>.
 --%>
<%@ page import="org.grails.tlc.books.DocumentType" %>
<!doctype html>
<html>
<head>
    <meta name="generator" content="company"/>
    <title><g:msg code="list" domain="documentType"/></title>
</head>
<body>
<div class="nav" role="navigation">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:msg code="default.home.label" default="Home"/></a></span>
    <span class="menuButton"><g:link class="menu" controller="systemMenu" action="display"><g:msg code="systemMenu.display" default="Menu"/></g:link></span>
    <span class="menuButton"><g:link class="create" action="create"><g:msg code="new" domain="documentType"/></g:link></span>
</div>
<div id="main-content" class="body" role="main">
    <g:pageTitle code="list" domain="documentType"/>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message.encodeAsHTML()}${flash.clear()}</div>
    </g:if>

    <div class="criteria">
        <g:criteria include="code, name, nextSequenceNumber, type*, autoGenerate, allowEdit"/>
    </div>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="code" title="Code" titleKey="documentType.code.label"/>

                <g:sortableColumn property="name" title="Name" titleKey="documentType.name.label"/>

                <th><g:msg code="documentType.type.label" default="Type"/></th>

                <g:sortableColumn property="nextSequenceNumber" title="Next Sequence Number" titleKey="documentType.nextSequenceNumber.label"/>

                <g:sortableColumn property="autoGenerate" title="Auto Generate" titleKey="documentType.autoGenerate.label"/>

                <g:sortableColumn property="allowEdit" title="Allow Edit" titleKey="documentType.allowEdit.label"/>

                <th><g:msg code="documentType.autoPayments" default="Auto Payments"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${documentTypeInstanceList}" status="i" var="documentTypeInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show" id="${documentTypeInstance.id}">${display(bean: documentTypeInstance, field: 'code')}</g:link></td>

                    <td>${display(bean: documentTypeInstance, field: 'name')}</td>

                    <td><g:msg code="systemDocumentType.name.${documentTypeInstance.type.code}" default="${documentTypeInstance.type.name}"/></td>

                    <g:if test="${['ACR', 'PRR'].contains(documentTypeInstance?.type?.code)}">
                        <td><g:msg code="generic.not.applicable" default="n/a"/></td>

                        <td><g:msg code="generic.not.applicable" default="n/a"/></td>

                        <td><g:msg code="generic.not.applicable" default="n/a"/></td>
                    </g:if>
                    <g:else>
                        <td>${display(bean: documentTypeInstance, field: 'nextSequenceNumber')}</td>

                        <td>${display(bean: documentTypeInstance, field: 'autoGenerate')}</td>

                        <td>${display(bean: documentTypeInstance, field: 'allowEdit')}</td>

                        <td>
                            <g:if test="${documentTypeInstance.type?.code == 'BP'}">
                                <g:display value="${documentTypeInstance.autoBankAccount != null}"/>
                            </g:if>
                        </td>
                    </g:else>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${documentTypeInstanceTotal}"/>
    </div>
</div>
</body>
</html>
